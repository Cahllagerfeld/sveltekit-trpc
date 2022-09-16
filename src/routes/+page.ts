import type { Load } from '@sveltejs/kit';
import { client } from '$lib/trpc/client/client';

export const load: Load = async ({ fetch }) => {
	const data = await client(fetch).query('get');
	return data;
};
