import * as trpc from '@trpc/client';
import type { Router } from '$lib/trpc/server/router';

const url = '/api/trpc';

export const client = (loadFetch?: any) =>
	trpc.createTRPCClient<Router>({
		url,
		...(loadFetch && { fetch: loadFetch })
	});
