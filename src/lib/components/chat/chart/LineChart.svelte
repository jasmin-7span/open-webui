<script>
	import { onMount } from 'svelte';
	import Plotly from 'plotly.js-dist-min';

	let chartDiv;

	let data = [
		{
			x: [1, 2, 3, 4, 5],
			y: [10, 15, 13, 17, 10],
			type: 'scatter',
			mode: 'lines+markers',
			name: 'Line Chart'
		}
	];
	let layout = { title: 'Line Chart', xaxis: { title: 'X Axis' }, yaxis: { title: 'Y Axis' } };

	const renderPlotlyChart = () => {
		if (chartDiv) {
			Plotly.newPlot(chartDiv, data, layout);
		}
	};

	onMount(() => {
		// Use Plotly.react to update the chart based on the type
		renderPlotlyChart();
		console.log("E--", "chart")
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
