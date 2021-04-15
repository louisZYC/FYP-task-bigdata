<<?php
    $conn = mysqli_connect('localhost', 'root', '', 'fypdb') or die();

    $TABLES = array('SearchHistory', 'SearchRef');

    $rtn = array("SearchHistory" => array(), "SearchRef" => array());


    $query = '';
    foreach ($TABLES as $table)
        $query .= "SELECT * FROM `${table}`;";

    $conn->multi_query($query);

    foreach ($TABLES as $table) {
        $resultA = $conn->store_result();

        while ($target = $resultA->fetch_assoc()) {
            $rtn[$table][] = $target;
        }

        $resultA->free();

        if ($conn->more_results() == false) break;

        $conn->next_result();
    }


    $searchHistory = $rtn['SearchHistory'];
    $searchRef = $rtn['SearchRef'];

    while (count($searchRef)) {
        $pop = array_pop($searchRef);
        foreach($searchHistory as &$search)
        if($search['search_id'] == $pop['search_id'])
        $search['service'][] = (object)[
            'sevice_id'=>$pop['service_id'],
            'priority'=>$pop['priority']
        ];
    }



    echo "<pre>";
    echo json_encode($searchHistory, JSON_PRETTY_PRINT);
    echo "</pre>";
    ?>