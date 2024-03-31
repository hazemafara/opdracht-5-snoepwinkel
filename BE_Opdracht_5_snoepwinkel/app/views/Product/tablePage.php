<?php $this->component('pageHead', ['title' => "ProductOverview"]); ?>

<body>
    <div class="container">
        <h1 class="title"><?= $data['title'] ?></h1>

        <table>
            <thead>
                <?php
                $this->component('tableHead', ['tableHead' => $data['tableHead']]);
                ?>
            </thead>

            <tbody>
                <?php
                foreach ($data['tableData'] as $dataRow) {
                    $this->component('tableRow', $dataRow);
                }
                ?>
            </tbody>

        </table>
    </div>
</body>

</html>