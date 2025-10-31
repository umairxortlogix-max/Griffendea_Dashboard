

<?php $__env->startSection('content'); ?>
    <div class="max-w-7xl mx-auto p-6 bg-gray-50 min-h-screen">
      <?php echo $__env->make('admin.partials.opportunityTab', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
        <h1 class="text-2xl font-semibold mb-4">📊 Lead Intake Stats</h1>


        <!-- 🔹 Filter Section -->
        <section class="bg-white rounded-2xl shadow p-4 mb-6">
            <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Assigned User</label>
                    <select id="userSelect" class="w-full rounded-lg border-gray-300 shadow-sm p-2">
                        <option value="all">All Users</option>
                        <?php $__currentLoopData = $users; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $user): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <option value="<?php echo e($user->id); ?>"><?php echo e($user->first_name); ?> <?php echo e($user->last_name); ?></option>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    </select>
                </div>

                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">From Date</label>
                    <input id="fromDate" type="date" class="w-full rounded-lg border-gray-300 shadow-sm p-2">
                </div>

                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">To Date</label>
                    <input id="toDate" type="date" class="w-full rounded-lg border-gray-300 shadow-sm p-2">
                </div>
            </div>

            <div class="flex gap-3 mt-4">
                <button id="last7" class="px-4 py-2 bg-indigo-600 text-white rounded-md">Last 7 Days</button>
                <button id="last30" class="px-4 py-2 bg-indigo-500 text-white rounded-md">Last 30 Days</button>
                <button id="applyBtn" class="ml-auto px-4 py-2 bg-green-600 text-white rounded-md">Apply</button>
            </div>
        </section>

        <!-- 🔹 Chart Section -->
        <section class="grid grid-cols-1 lg:grid-cols-2 gap-6">
            <div class="bg-white p-4 rounded-2xl shadow">
                <h2 class="text-lg font-medium mb-3">🧩 New Lead → Didn’t Respond / Responded</h2>
                <canvas id="newLeadChart" height="200"></canvas>
                <p id="newLeadSubtitle" class="text-sm text-gray-600 mt-2"></p>
            </div>

            <div class="bg-white p-4 rounded-2xl shadow">
                <h2 class="text-lg font-medium mb-3">✅ Lead Responded → Qualified / Low / Disqualified</h2>
                <canvas id="respondedChart" height="200"></canvas>
                <p id="respondedSubtitle" class="text-sm text-gray-600 mt-2"></p>
            </div>
        </section>

        <!-- 🔹 Summary -->
        <section class="mt-6 bg-white rounded-2xl shadow p-4">
            <h3 class="text-md font-semibold mb-3">Summary (Selected Period)</h3>
            <div id="numbersContainer" class="grid grid-cols-1 md:grid-cols-3 gap-4"></div>
        </section>
    </div>

    <!-- Scripts -->
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.0/dist/chart.umd.min.js"></script>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const userSelect = document.getElementById('userSelect');
            const fromDate = document.getElementById('fromDate');
            const toDate = document.getElementById('toDate');
            const applyBtn = document.getElementById('applyBtn');
            const last7 = document.getElementById('last7');
            const last30 = document.getElementById('last30');

            function setRange(days) {
                const to = new Date();
                const from = new Date();
                from.setDate(to.getDate() - (days - 1));
                toDate.value = to.toISOString().slice(0, 10);
                fromDate.value = from.toISOString().slice(0, 10);
            }
            setRange(7);

            last7.addEventListener('click', () => setRange(7));
            last30.addEventListener('click', () => setRange(30));

            let newLeadChart, respondedChart;

            function createCharts() {
                const newCtx = document.getElementById('newLeadChart').getContext('2d');
                const respCtx = document.getElementById('respondedChart').getContext('2d');

                newLeadChart = new Chart(newCtx, {
                    type: 'doughnut',
                    data: {
                        labels: ["Didn’t Respond", "Responded"],
                        datasets: [{ data: [0, 0], backgroundColor: ['#fbbf24', '#22c55e'] }]
                    },
                    options: { plugins: { legend: { position: 'bottom' } } }
                });

                respondedChart = new Chart(respCtx, {
                    type: 'doughnut',
                    data: {
                        labels: ['Qualified', 'Low Priority', 'Disqualified'],
                        datasets: [{ data: [0, 0, 0], backgroundColor: ['#22c55e', '#eab308', '#ef4444'] }]
                    },
                    options: { plugins: { legend: { position: 'bottom' } } }
                });
            }
            createCharts();

            async function fetchStats(params) {
                const url = `${window.routes.leadIntakeStats}?user=${encodeURIComponent(params.user)}&from=${params.from}&to=${params.to}`;

                const res = await fetch(url, {
                    headers: {
                        'X-Requested-With': 'XMLHttpRequest',
                        'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
                    }
                });
                return await res.json();
            }
            window.routes = {
                leadIntakeStats: "<?php echo e(route('admin.lead-intake-stats')); ?>"
            };
            function updateUI(data) {
                const s = data.summary;

                // ✅ Calculate total leads for percentage
                const totalLeads =
                    (s.newLead_to_didNotRespond || 0) +
                    (s.newLead_to_responded || 0) +
                    (s.responded_to_qualified || 0) +
                    (s.responded_to_lowPriority || 0) +
                    (s.responded_to_disqualified || 0);

                // ✅ Update Charts
                newLeadChart.data.datasets[0].data = [s.newLead_to_didNotRespond, s.newLead_to_responded];
                respondedChart.data.datasets[0].data = [
                    s.responded_to_qualified,
                    s.responded_to_lowPriority,
                    s.responded_to_disqualified
                ];
                newLeadChart.update();
                respondedChart.update();

                // ✅ Update chart subtitles
                document.getElementById('newLeadSubtitle').textContent =
                    `Didn’t Respond: ${s.newLead_to_didNotRespond}, Responded: ${s.newLead_to_responded}`;
                document.getElementById('respondedSubtitle').textContent =
                    `Qualified: ${s.responded_to_qualified}, Low: ${s.responded_to_lowPriority}, Disqualified: ${s.responded_to_disqualified}`;

                // ✅ Show summary cards with percentage
                const cont = document.getElementById('numbersContainer');
                cont.innerHTML = '';

                Object.entries(s).forEach(([key, value]) => {
                    const percentage = totalLeads > 0 ? ((value / totalLeads) * 100).toFixed(1) : 0;

                    const card = document.createElement('div');
                    card.className = 'p-4 border rounded-lg text-center shadow-sm bg-white';
                    card.innerHTML = `
                <div class="text-gray-500 text-sm capitalize">${key.replaceAll('_', ' ')}</div>
                <div class="text-2xl font-semibold text-gray-800">${value}</div>
                <div class="text-sm text-blue-600 mt-1 font-medium">${percentage}%</div>
            `;
                    cont.appendChild(card);
                });
            }


            async function loadData() {
                const params = {
                    user: userSelect.value || 'all',
                    from: fromDate.value,
                    to: toDate.value
                };
                const data = await fetchStats(params);
                updateUI(data);
            }

            applyBtn.addEventListener('click', loadData);
            loadData();
        });
        document.getElementById('newLeadSubtitle').textContent =
            `New Leads: ${s.newLead_total}, Didn’t Respond: ${s.newLead_to_didNotRespond}, Responded: ${s.newLead_to_responded}`;

        const cont = document.getElementById('numbersContainer');
        cont.innerHTML = `
            <div class="p-4 border rounded-lg text-center shadow-sm">
                <div class="text-gray-500 text-sm">Total New Leads</div>
                <div class="text-2xl font-semibold text-gray-800">${s.newLead_total}</div>
            </div>`;

    </script>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('admin.layouts.index', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH /home/u878439255/domains/lightsalmon-boar-673636.hostingersite.com/public_html/resources/views/admin/opportunitieIntaka.blade.php ENDPATH**/ ?>