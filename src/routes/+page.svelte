<script lang="ts">
	import { client } from '$lib/trpc/client/client';
	export let data: string[];

	let input: string = '';

	const sendData = async () => {
		const response = await client().mutation('create', input);
		console.log(response);
	};
</script>

<input placeholder="Input your value" bind:value={input} />
<button on:click={() => sendData()}>Send</button>
<pre>
    {JSON.stringify(data)}
</pre>
