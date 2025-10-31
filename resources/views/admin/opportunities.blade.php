@extends('admin.layouts.index')
@section('content')
    <div class="wrapper">
        <div class="mx-auto max-w-8xl px-4 py-6 sm:px-6 lg:px-8">

            @include('admin.partials.opportunityTab')
            <div id="pipeline-container" class="flex flex-wrap ">

                @foreach ($pipelines as $pipeline)
                    <div class="w-full sm:w-1/4 lg:w-1/5 p-2">
                        <div class="rounded-2xl bg-white shadow cursor-pointer h-[120px] stage-card"
                            data-pipeline-id="{{ $pipeline->pipeline_id }}" data-pipeline-name="{{ $pipeline->pipeline_name }}">
                            <div class="p-5">
                                <div class="flex items-center">
                                    <div>
                                      <div class="h-10"><p class="text-sm text-gray-900"><b>{{ $pipeline->pipeline_name }}</b></p></div>
                                        <div class="mt-0 flex items-center gap-4">
                                            <h5 class="m-0 text-[22px] font-extrabold text-slate-500">
                                                ${{ number_format($pipeline->total_monetary_value, 2) }}
                                            </h5>
                                            <p class="m-0 text-sm font-bold text-blue-600"
                                                data-pipeline-id="{{ $pipeline->pipeline_id }}">
                                                {{ $pipeline->total_stages }} stages
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
            <div class="flex items-center gap-4 mb-4">
                <label for="dateRange" class="text-sm font-medium text-gray-700"><b>Date</b></label>
                <input type="text" id="dateRange"
                    class="rounded-lg border border-gray-300 px-3 py-2 text-sm text-gray-700 shadow-sm"
                    placeholder="Select Date" readonly />
            </div>
            <div class="grid grid-cols-1 gap-6 lg:grid-cols-12">
                <div class="lg:col-span-4">
                    <div class="rounded-2xl bg-white shadow">
                        <div class="border-b px-5 py-4">
                            <h4 class="text-lg font-bold text-gray-800">Opportunities Status(Close / Open / Won)</h4>
                        </div>
                        <div class="p-5">
                            <div id="pieChart" style="width:100%; height: 440px;"></div>
                        </div>
                    </div>
                </div>
                <div class="lg:col-span-4 w-full">
                    <div class="rounded-2xl bg-white shadow-lg hover:shadow-xl transition-shadow duration-300">
                        <div class="p-4 sm:p-6">
                            <div class="flex flex-col sm:flex-col sm:items-center sm:justify-between mb-4 gap-4">
                                <h2
                                    class="text-base sm:text-base md:text-base font-bold text-gray-800 text-center sm:text-left">
                                    Pipeline-Wise Opportunity Status
                                </h2>
                                <select name="pipelineStages" id="pipelineStages"
                                    class="w-full sm:max-w-xs md:max-w-sm rounded-lg border border-gray-300 bg-white px-3 py-2 text-sm text-gray-700 
                                                                                                                                     shadow-sm focus:border-blue-500 focus:ring-2 focus:ring-blue-200 transition truncate">
                                    <option value="">-- Select Pipeline --</option>
                                    @foreach ($totalPiplines as $pipeline)
                                        <option value="{{ $pipeline->pipeline_id }}">{{ $pipeline->name }} </option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="">
                                <canvas id="pipelineDonut" class="custom-chart w-full "></canvas>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="lg:col-span-4 w-full">
                    <div class="rounded-2xl bg-white shadow-lg hover:shadow-xl transition-shadow duration-300">
                        <div class="p-4 sm:p-6">
                            <div class="flex flex-col sm:flex-col sm:items-center sm:justify-between mb-4 gap-4">
                                <h2
                                    class="text-base sm:text-base md:text-base font-bold text-gray-800 text-center sm:text-left">
                                    Stages Opportunities Status
                                </h2>
                                <select id="pipelineSelect"
                                    class="w-full sm:max-w-xs md:max-w-sm rounded-lg border border-gray-300 bg-white px-3 py-2 text-sm text-gray-700 
                                                                                    shadow-sm focus:border-blue-500 focus:ring-2 focus:ring-blue-200 transition truncate">
                                    <option value="">-- Select Pipeline --</option>
                                    @foreach ($PipelinesIds as $pipeline)
                                        <option value="{{ $pipeline->id }}">{{ $pipeline->name }}</option>
                                    @endforeach
                                </select>
                            </div>

                            <div class="">
                                <canvas id="pipelineDonut2" class="custom-chart w-full"></canvas>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

            <!-- <div class="mt-6 grid grid-cols-1 gap-6 lg:grid-cols-12">

                                                            <div class="lg:col-span-6">
                                                                <div class="rounded-2xl bg-white shadow-lg hover:shadow-xl transition-shadow duration-300">
                                                                    <div class="p-4 sm:p-6">
                                                                        <div class="flex items-center justify-between mb-4">
                                                                            <h2 class="text-base font-bold text-gray-800">Monthly Opportunities</h2>
                                                                            <div class="text-sm font-semibold text-blue-600" id="monthlyChartTotalOpportunities"></div>
                                                                        </div>
                                                                        <div id="chart-opportunities-month"></div>
                                                                    </div>
                                                                </div>
                                                            </div>


                                                            <div class="lg:col-span-6">
                                                                <div class="rounded-2xl bg-white shadow-lg hover:shadow-xl transition-shadow duration-300">
                                                                    <div class="p-4 sm:p-6">
                                                                        <div class="flex items-center justify-between mb-4">
                                                                            <h2 class="text-base font-bold text-gray-800">Pipeline Velocity</h2>
                                                                        </div>
                                                                        <div id="pipelineVelocityChart"></div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div> -->
        </div>
    </div>
    <div id="stageModal"
        class="hidden fixed inset-0 flex items-center justify-center bg-black bg-opacity-50 z-50 transition-opacity duration-300">
        <div id="modalContent"
            class="bg-white rounded-2xl shadow-2xl p-6 w-3/4 max-w-4xl transform transition-all duration-500 scale-95 opacity-0">
            <h2 class="text-2xl font-bold text-slate-800 mb-4">Stage Conversion</h2>
            <p class="text-gray-600 mb-4">Pipeline: <span id="modalPipeline"></span></p>
            <div id="modalStages" class="mt-4 space-y-2 max-h-96 overflow-y-auto"></div>

            <div class="mt-6 flex justify-end">
                <button id="closeModal"
                    class="px-4 py-2 rounded-lg bg-red-500 text-white hover:bg-red-600 transition-colors duration-300">
                    Close
                </button>
            </div>
        </div>
    </div>
@endsection
@section('scripts')
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="{{ asset('template/js/backend-bundle.min.js') }}"></script>
    <script src="{{ asset('template/js/customizer.js') }}"></script>
    <script src="{{ asset('template/js/sidebar.js') }}"></script>
    <script src="{{ asset('template/js/flex-tree.min.js') }}"></script>
    <script src="{{ asset('template/js/tree.js') }}"></script>
    <script src="{{ asset('template/js/table-treeview.js') }}"></script>
    <script src="{{ asset('template/js/sweetalert.js') }}"></script>
    <script src="{{ asset('template/js/vector-map-custom.js') }}"></script>
    <script src="{{ asset('template/js/chart-custom.js') }}"></script>
    <script src="{{ asset('template/js/chart_1.js') }}"></script>
    <script src="{{ asset('template/js/chart_2.js') }}"></script>
    <script src="{{ asset('template/js/slider.js') }}"></script>
    <script src="{{ asset('template/js/app.js') }}"></script>


    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
    <script src="https://cdn.jsdelivr.net/npm/moment@2.29.4/moment.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/choices.js/public/assets/styles/choices.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/choices.js/public/assets/scripts/choices.min.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels"></script>


    <script>

        // daterangepicker will be initialized inside document.ready (after plugin loads)

        $(document).ready(function () {
            var userId = null;
            // Initialize date range picker after plugin is loaded
            if ($.fn.daterangepicker) {
                // Initialize as single date picker (select one date)
                $('#dateRange').daterangepicker({
                    opens: 'left',
                    autoUpdateInput: false,
                    singleDatePicker: true,
                    locale: { cancelLabel: 'Clear' }
                });

                $('#dateRange').on('apply.daterangepicker', function (ev, picker) {
                    // Set single date in YYYY-MM-DD
                    $(this).val(picker.startDate.format('YYYY-MM-DD'));
                    updateAllCharts(); // refresh charts with selected date
                });

                $('#dateRange').on('cancel.daterangepicker', function (ev, picker) {
                    $(this).val('');
                    updateAllCharts(); // refresh charts with no date filter
                });
            } else {
                console.warn('daterangepicker plugin not available; date filter will not initialize.');
            }
            var pipelineDonutChart = null;
            var chart = null;
            var piechart = null;
            var pipelineVelocityChart = null;


            renderEmptyChart();
            loadMonthlyChart();
            loadPieChart();
            fetchPiplineVelocity();


            function fetchPiplineVelocity() {
                $.ajax({
                    url: "{{ route('admin.pipelineVelocity') }}",
                    type: "GET",
                    data: {
                        userId: userId
                    },
                    success: function (response) {
                        renderPiplineVelocity(response);
                    },
                    error: function (xhr) {
                        console.error("Failed to load pipeline velocity:", xhr.responseText);
                    }
                });
            }

            // Initialize Choices.js if element exists
            // Choices.js initialization for user filter is disabled because the dropdown is commented out

            // Handle dropdown change
            // User filter dropdown change handler is disabled because the dropdown is commented out

            /**
             * Master function -> fetches all dashboard data
             */
            function updateAllCharts() {
                let dateRange = $('#dateRange').val();
                let startDate = null;
                let endDate = null;

                if (dateRange) {
                    // single date selected; use as both start and end
                    startDate = dateRange;
                    endDate = dateRange;
                }
                const url = "{{ route('admin.updateAllCharts') }}";
                console.log('updateAllCharts ->', { url, userId: userId || null, startDate, endDate });

                $.ajax({
                    url: url,
                    method: "GET",
                    dataType: 'json',
                    data: {
                        userId: userId || null,
                        startDate: startDate,
                        endDate: endDate
                    },
                    beforeSend: function () {
                        // visual debug
                        console.debug('Sending updateAllCharts request', { startDate, endDate });
                    },
                    success: function (response) {
                        console.log('updateAllCharts -> success', response);
                        renderPipelineCards(response.pipelines);
                        renderMonthlyChart(response.monthlyOpportunites);
                        renderPieChart(response.openTotal, response.closedTotal, response.wonTotal);
                        renderPiplineVelocity(response.results);
                        // ensure pipeline-specific charts respect the active date filter
                        try {
                            updatePipelineSelectCharts();
                        } catch (e) {
                            console.debug('updatePipelineSelectCharts not available yet', e);
                        }
                    },
                    error: function (xhr, status, err) {
                        console.error('updateAllCharts -> error', {
                            status: xhr.status,
                            statusText: xhr.statusText,
                            responseText: xhr.responseText,
                            error: err,
                            jqStatus: status
                        });
                        if (xhr.status === 419) {
                            console.warn('CSRF token mismatch or session expired. Try reloading the page.');
                        }
                    },
                });
            }

            // Expose to global so handlers outside this ready block can call it
            window.updateAllCharts = updateAllCharts;

            // Refresh pipeline select-based charts (pipelineStages and pipelineSelect)
            function updatePipelineSelectCharts() {
                // Trigger the pipelineStages change handler so it will include date filters
                const pipelineStagesVal = $('#pipelineStages').val();
                if (pipelineStagesVal) {
                    $('#pipelineStages').trigger('change');
                }

                // Trigger pipelineSelect's change to refresh stages donut (if selected)
                const pipelineSelectEl = document.getElementById('pipelineSelect');
                if (pipelineSelectEl && pipelineSelectEl.value) {
                    pipelineSelectEl.dispatchEvent(new Event('change'));
                }
            }

            // Auto-select the first pipeline in both selects (if any) and trigger change to render default charts
            const firstPipelineStages = $('#pipelineStages option:not([value=""])').first().val();
            if (firstPipelineStages) {
                $('#pipelineStages').val(firstPipelineStages).trigger('change');
            }

            // Defer selecting and triggering pipelineSelect until its handler is attached
            const firstPipelineSelect = $('#pipelineSelect option:not([value=""])').first().val();
            if (firstPipelineSelect) {
                // set the value but do not trigger change here; the handler may not be attached yet
                $('#pipelineSelect').val(firstPipelineSelect);
            }

            /**
             * Render pipeline cards
             */
            function renderPipelineCards(pipelines) {
                let container = $("#pipeline-container");
                container.empty();

                pipelines.forEach(function (stage) {
                    container.append(`
                                                                                                                <div class="w-full sm:w-1/4 lg:w-1/5 p-2">
                                                                                                                    <div class="rounded-2xl bg-white shadow cursor-pointer stage-card" 
                                                                                                                        data-pipeline-id="${stage.pipeline_id}"
                                                                                                                        data-pipeline-name="${stage.pipeline_name}">
                                                                                                                        <div class="p-5">
                                                                                                                            <div class="flex items-center">
                                                                                                                                <div>
                                                                                                                                    <p class="m-0 text-sm text-gray-900">${stage.pipeline_name}</p>
                                                                                                                                    <div class="mt-1 flex items-center gap-3">
                                                                                                                                        <h5 class="m-0 text-[22px] font-extrabold text-slate-500">
                                                                                                                                            $${Number(stage.total_monetary_value).toLocaleString()}
                                                                                                                                        </h5>
                                                                                                                                        <p class="m-0 text-sm font-bold text-blue-600" 
                                                                                                                                           data-pipline-id="${stage.pipeline_id}">
                                                                                                                                            ${stage.total_stages} stages
                                                                                                                                        </p>
                                                                                                                                    </div>
                                                                                                                                </div>
                                                                                                                            </div>
                                                                                                                        </div>
                                                                                                                    </div>
                                                                                                                </div>
                                                                                                            `);
                });
            }



            $(document).on("click", ".stage-card", function () {
                let pipelineId = $(this).data("pipeline-id");
                let pipelineName = $(this).data("pipeline-name");

                // Open modal
                $("#stageModal").removeClass("hidden");
                $("#modalPipeline").text(pipelineName);


                $.ajax({
                    url: "{{ route('admin.singlePiplineStageConversion') }}",
                    type: "GET",
                    data: {
                        pipelineId: pipelineId
                    },
                    success: function (response) {
                        $('#modalStages').empty();
                        response.forEach((stage, index) => {
                            if (index < response.length - 1) {
                                const nextStage = response[index + 1];
                                $('#modalStages').append(`
                                                                                                                            <div class="flex justify-between items-center border-b border-gray-200 py-2">
                                                                                                                                <span class="text-gray-1000">${stage.stage_name} → ${nextStage.stage_name}</span>
                                                                                                                                <span class="font-bold text-slate-800">${stage.avg_duration_human}</span>
                                                                                                                            </div>
                                                                                                                        `);
                            }
                        });
                        // $('#stageModal').removeClass('hidden');
                        // setTimeout(() => {
                        //     $('#modalContent')
                        //         .removeClass('scale-95 opacity-0')
                        //         .addClass('scale-100 opacity-100');
                        // }, 100);

                        $("#stageModal").fadeIn(300); // fade in over 300ms
                        $("#modalContent").css({
                            transform: 'scale(0.95)',
                            opacity: 0
                        })
                            .animate({
                                transform: 'scale(1)',
                                opacity: 1
                            }, {
                                step: function (now, fx) {
                                    if (fx.prop === "transform") {
                                        $(this).css("transform", "scale(" + now + ")");
                                    }
                                },
                                duration: 300
                            });

                    },
                    error: function () {
                        $("#modalContent").html(
                            "<p class='text-red-500'>Failed to load details.</p>"
                        );
                    },
                });
            });

            function closeStageModal() {
                $("#modalContent").animate({
                    opacity: 0
                }, {
                    duration: 200,
                    step: function (now, fx) {
                        const scale = 0.95 + 0.05 * now;
                        $(this).css("transform", `scale(${scale})`);
                    },
                    complete: function () {
                        $("#stageModal").fadeOut(200);
                    }
                });

            }

            $("#closeModal").click(function () {
                closeStageModal();
            });

            $("#stageModal").click(function (e) {
                if ($(e.target).is("#stageModal")) {
                    closeStageModal();
                }
            });

            /**
             * Render monthly opportunities chart
             */
            function renderMonthlyChart(data) {
                let total = data.reduce((a, b) => a + b, 0);
                const chartElement = document.getElementById('chart-opportunities-month');

                if (!chartElement) {
                    console.warn('Monthly chart element not found');
                    return;
                }

                // Set the sum into the element
                $('#monthlyChartTotalOpportunities').text(total);
                if (chart) {
                    chart.destroy();
                }

                var options = {
                    chart: {
                        type: "bar",
                        height: 250,
                    },
                    series: [{
                        name: "Opportunities",
                        data: data,
                    }],
                    colors: ["#007bff"],
                    plotOptions: {
                        bar: {
                            columnWidth: "40%",
                            borderRadius: 4,
                        },
                    },
                    dataLabels: {
                        enabled: false,
                    },
                    xaxis: {
                        categories: [
                            "Jan", "Feb", "Mar", "Apr", "May", "Jun",
                            "Jul", "Aug", "Sep", "Oct", "Nov", "Dec",
                        ],
                    },
                };

                chart = new ApexCharts(
                    document.querySelector("#chart-opportunities-month"),
                    options
                );
                chart.render();
            }

            /**
             * Render pie chart (open/closed/won)
             */

            function renderPieChart(open, closed, won) {
                if (piechart) {
                    piechart.destroy();
                }

                let total = open + closed + won;

                var options = {
                    chart: {
                        type: "pie",
                        height: 350,
                    },
                    labels: ["Open", "Close", "Won"],
                    series: total === 0 ? [] : [open, closed, won], // if all 0, pass empty
                    colors: ["#FFBB33", "#006FE6", "#65D778"],
                    legend: {
                        position: "bottom",
                    },
                    noData: {
                        text: "No Data Available",
                        align: "center",
                        verticalAlign: "middle",
                        style: {
                            color: "#999",
                            fontSize: "16px",
                        },
                    },
                };

                piechart = new ApexCharts(document.querySelector("#pieChart"), options);
                piechart.render();
            }

            /**
             * Render pipeline dropdown (<select>)
             */
            function renderPipelineDropdown(pipelines) {
                let dropdown = $("#pipelineStages");
                dropdown.empty();
                dropdown.append(`<option value="">-- Select Pipeline --</option>`);
                pipelines.forEach((p) => {
                    dropdown.append(
                        `<option value="${p.id}">${p.name}</option>`
                    );
                });
            }

            function loadMonthlyChart() {
                $.ajax({
                    url: "{{ route('admin.piplinesData') }}",
                    method: "GET",
                    data: {
                        userId: null
                    },
                    success: function (response) {
                        renderMonthlyChart(response);
                    },
                    error: function (xhr) {
                        console.error("Error loading monthly data:", xhr.responseText);
                    }
                });
            }

            function loadPieChart() {
                $.ajax({
                    url: "{{ route('admin.opportunitiesStatusPieChart') }}",
                    method: "GET",

                    success: function (response) {
                        renderPieChart(response.won, response.close, response.open);
                    },
                    error: function (xhr) {
                        console.error("Error loading monthly data:", xhr.responseText);
                    }
                });
            }

            $('#pipelineStages').on('change', function () {
                let pipeline_id = $(this).val();

                if (!pipeline_id) {
                    renderEmptyChart();
                    return;
                }

                // include active date filter when requesting pipeline distribution (single date)
                let dateRange = $('#dateRange').val();
                let startDate = null;
                let endDate = null;
                if (dateRange) {
                    startDate = dateRange;
                    endDate = dateRange;
                }

                $.ajax({
                    url: "{{ route('admin.pipelineStageDistribution') }}",
                    type: "GET",
                    data: {
                        pipeline_id: pipeline_id,
                        userId: userId,
                        startDate: startDate,
                        endDate: endDate
                    },
                    success: function (response) {
                        if (response.open == 0 && response.won == 0 && response.close == 0) {
                            renderEmptyChart();
                            return;
                        }
                        let data = [response.open, response.won, response.close];
                        renderDonoutChart(data);
                    },
                    error: function (xhr) {
                        console.error("Error fetching pipeline distribution:", xhr.responseText);
                        renderEmptyChart();
                    }
                });
            });

            // function renderDonoutChart(data) {

            //     if (pipelineDonutChart) {
            //         pipelineDonutChart.destroy();
            //     }
            //     const ctx = document.getElementById('pipelineDonut').getContext('2d');
            //     pipelineDonutChart = new Chart(ctx, {
            //         type: 'doughnut',
            //         data: {
            //             labels: ['Open', 'Won', 'Closed'],
            //             datasets: [{
            //                 data: data,
            //                 backgroundColor: ['#3b82f6', '#22c55e', '#ef4444'],
            //             }]
            //         },
            //         options: {
            //             responsive: true,
            //             plugins: {
            //                 legend: {
            //                     position: 'bottom'
            //                 }
            //             }
            //         }
            //     });
            // }
            function renderDonoutChart(data) {
                if (pipelineDonutChart) {
                    pipelineDonutChart.destroy();
                }

                const ctx = document.getElementById('pipelineDonut').getContext('2d');

                // Calculate total
                const total = data.reduce((sum, val) => sum + val, 0);

                pipelineDonutChart = new Chart(ctx, {
                    type: 'doughnut',
                    data: {
                        labels: ['Open', 'Won', 'Closed'],
                        datasets: [{
                            data: data,
                            backgroundColor: ['#3b82f6', '#22c55e', '#ef4444'],
                            borderWidth: 2
                        }]
                    },
                    options: {
                        responsive: true,
                        cutout: '70%',
                        plugins: {
                            legend: {
                                position: 'bottom',
                                labels: {
                                    padding: 20,
                                    font: {
                                        size: 12
                                    }
                                }
                            },
                            tooltip: {
                                enabled: true
                            },
                            datalabels: {
                                color: '#fff',
                                font: {
                                    weight: 'bold',
                                    size: 14
                                },
                                formatter: (value) => value > 0 ? value : ''
                            }
                        }
                    },
                    plugins: [
                        ChartDataLabels,
                        {
                            id: 'centerText',
                            beforeDraw(chart) {
                                const {
                                    ctx,
                                    chartArea: {
                                        width,
                                        height
                                    }
                                } = chart;
                                ctx.save();
                                ctx.font = 'bold 18px sans-serif';
                                ctx.textAlign = 'center';
                                ctx.fillStyle = '#111827';
                                ctx.fillText(total || 'No Data', width / 2, height / 2 + 6);
                            }
                        }
                    ]
                });
            }


            function renderEmptyChart() {
                if (pipelineDonutChart) {
                    pipelineDonutChart.destroy();
                }
                const ctx = document.getElementById('pipelineDonut').getContext('2d');
                pipelineDonutChart = new Chart(ctx, {
                    type: 'doughnut',
                    data: {
                        labels: ['No Data'],
                        datasets: [{
                            data: [1],
                            backgroundColor: ['#d1d5db'],
                            borderWidth: 2
                        }]
                    },
                    options: {
                        responsive: true,
                        cutout: '70%',
                        plugins: {
                            legend: {
                                display: false
                            },
                            tooltip: {
                                enabled: false
                            },
                            datalabels: {
                                display: false
                            }
                        }
                    },
                    plugins: [ChartDataLabels]
                });
            }

            function renderPiplineVelocity(data) {
                const chartElement = document.getElementById('pipelineVelocityChart');

                if (!chartElement) {
                    console.warn('Pipeline velocity chart element not found');
                    return;
                }

                if (pipelineVelocityChart) {
                    pipelineVelocityChart.destroy();
                }

                let pipelineNames = data.map(item => item.pipeline_name);

                let avgTimes = data.map(item => {
                    let parts = item.avg_pipeline_time_human.split(":");
                    let hours = parseInt(parts[0], 10);
                    let minutes = parseInt(parts[1], 10);
                    let seconds = parseInt(parts[2], 10);

                    return (hours + minutes / 60 + seconds / 3600).toFixed(2);
                });

                var options = {
                    chart: {
                        type: "line",
                        height: 350,
                    },
                    series: [{
                        name: "Avg Completion Time (hours)",
                        data: avgTimes
                    }],
                    xaxis: {
                        categories: pipelineNames,
                        title: {
                            text: "Pipelines"
                        }
                    },
                    yaxis: {
                        title: {
                            text: "Average Time (hours)"
                        }
                    },
                    stroke: {
                        curve: "smooth"
                    },
                    colors: ["#3b82f6"]
                };

                pipelineVelocityChart = new ApexCharts(
                    document.querySelector("#pipelineVelocityChart"),
                    options
                );
                pipelineVelocityChart.render();
            }


        });


        let pipelineDonutChart2 = null;

        document.getElementById('pipelineSelect').addEventListener('change', function () {
            const pipelineId = this.value;
            const stageCount = document.getElementById('stageCount');

            if (!pipelineId) {
                if (pipelineDonutChart2) pipelineDonutChart2.destroy();
                return;
            }

            let dr = $('#dateRange').val();
            let sDate = null;
            let eDate = null;
            if (dr) {
                sDate = dr;
                eDate = dr;
            }

            fetch("{{ route('admin.pipeline.stages') }}", {
                method: 'POST',
                credentials: 'same-origin',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
                },
                body: JSON.stringify({ pipeline_id: pipelineId, startDate: sDate, endDate: eDate })
            })
                .then(res => res.json())
                .then(data => {
                    const labels = data.stages.map(stage => stage.name);
                    const chartData = data.stages.map(stage => stage.opportunity_count);
                    const hasData = chartData.some(v => v > 0);

                    if (pipelineDonutChart2) pipelineDonutChart2.destroy();

                    const ctx = document.getElementById('pipelineDonut2').getContext('2d');

                    pipelineDonutChart2 = new Chart(ctx, {
                        type: 'doughnut',
                        data: {
                            labels,
                            datasets: [{
                                data: hasData ? chartData : [],
                                backgroundColor: [
                                    '#3b82f6', '#22c55e', '#ef4444', '#f59e0b',
                                    '#6366f1', '#ec4899', '#14b8a6', '#8b5cf6',
                                    '#10b981', '#f87171', '#0ea5e9'
                                ],
                                borderWidth: 2
                            }]
                        },
                        options: {
                            responsive: true,
                            cutout: '70%',
                            plugins: {
                                legend: {
                                    position: 'bottom',
                                    labels: { padding: 20, font: { size: 12 } }
                                },
                                tooltip: {
                                    callbacks: {
                                        label: ctx => `${ctx.label}: ${ctx.formattedValue} Opportunities`
                                    }
                                },
                                datalabels: {
                                    color: '#fff',
                                    font: { weight: 'bold', size: 14 },
                                    formatter: val => (val > 0 ? val : '')
                                }
                            }
                        },
                        plugins: [
                            ChartDataLabels,
                            {
                                id: 'centerText',
                                beforeDraw(chart) {
                                    const { ctx, chartArea: { width, height } } = chart;
                                    ctx.save();
                                    ctx.font = 'bold 18px sans-serif';
                                    ctx.textAlign = 'center';
                                    ctx.fillStyle = '#111827';
                                    ctx.fillText(
                                        hasData ? data.total_opportunities + ' Total' : 'No Data',
                                        width / 2,
                                        height / 2 + 6
                                    );
                                }
                            }
                        ]
                    });
                })

                .catch(() => {
                    stageCount.textContent = 'Error fetching stages.';
                });
        });

        // Ensure pipelineSelect auto-selects the first pipeline AFTER the change handler is attached
        (function ensurePipelineSelectDefault() {
            const sel = document.getElementById('pipelineSelect');
            if (!sel) return;
            // If nothing is selected, pick the first non-empty option and trigger change
            if (!sel.value) {
                const firstOpt = sel.querySelector('option:not([value=""])');
                if (firstOpt) {
                    sel.value = firstOpt.value;
                    sel.dispatchEvent(new Event('change'));
                }
            }
        })();

    </script>
@endsection