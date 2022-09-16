import type { Handle } from '@sveltejs/kit';
import { resolveHTTPResponse, type Dict } from '@trpc/server';
import { sequence } from '@sveltejs/kit/hooks';
import { router } from '$lib/trpc/server/router';

const endpointURL = '/api/trpc';

const handleTRPC: Handle = async ({ event, resolve }) => {
	if (event.url.pathname.startsWith(endpointURL)) {
		const request = event.request as Request & {
			headers: Dict<string | string[]>;
		};

		const req = {
			method: request.method,
			headers: request.headers,
			query: event.url.searchParams,
			body: await request.text()
		};

		const httpResponse = await resolveHTTPResponse({
			router,
			req,
			path: event.url.pathname.substring(endpointURL.length + 1),
			createContext: async () => null
		});

		const { status, headers, body } = httpResponse as {
			status: number;
			headers: Record<string, string>;
			body: string;
		};

		return new Response(body, { status, headers });
	}

	return await resolve(event);
};

export const handle: Handle = sequence(handleTRPC);
