<script>
	import { onMount } from 'svelte';
	import Plotly from 'plotly.js-dist-min';

	let chartDiv;

	let data = [
		{ x: ['A', 'B', 'C', 'D', 'E'], y: [10, 15, 13, 17, 10], type: 'bar', name: 'Bar Chart' }
	];
	let layout = { title: 'Bar Chart', xaxis: { title: 'Categories' }, yaxis: { title: 'Values' } };

	const renderPlotlyChart = () => {
		if (chartDiv) {
			Plotly.newPlot(chartDiv, data, layout);
		}
	};

	onMount(() => {
		// Use Plotly.react to update the chart based on the type
		renderPlotlyChart();

		return () => {
			if (chartDiv) {
				Plotly.purge(chartDiv);
			}
		};
	});

	// Reactive statement to update plot on data or layout change
	$: {
		if (chartDiv && data && layout) {
			Plotly.react(chartDiv, data, layout);
		}
	}
</script>

<div bind:this={chartDiv} class="w-3/4" />
