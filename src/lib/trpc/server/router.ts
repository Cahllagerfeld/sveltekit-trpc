import * as trpc from '@trpc/server';
import { z } from 'zod';

let data: string[] = [];

export const router = trpc
	.router()
	.query('get', {
		resolve: () => {
			return data;
		}
	})
	.mutation('create', {
		input: z.string(),
		resolve: ({ input }) => {
			data = [...data, input];
			return data;
		}
	});

export type Router = typeof router;
