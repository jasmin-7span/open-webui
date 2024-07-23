<script>
	import { onMount, tick } from 'svelte';
	import Skeleton from './Skeleton.svelte';
	import LineChart from '../chart/LineChart.svelte';
	import BarChart from '../chart/BarChart.svelte';
	import PieChart from '../chart/PieChart.svelte';

	const getData = async () => {
		const data = await new Promise((resolve) => setTimeout(resolve, 3000));
		// const data = await fetch(`https://jsonplaceholder.typicode.com/todos`);
		console.log('E--', 'try', data);
		return data;
	};
</script>

<!-- {#if isLoadingChart}
  <Skeleton />
{:else}
  <LineChart /> -->
<!-- {/if} -->
{#await getData()}
	<Skeleton />
{:then data}
	<LineChart />
	<!-- <br />
	<BarChart />
	<br />
	<PieChart /> -->
{/await}
