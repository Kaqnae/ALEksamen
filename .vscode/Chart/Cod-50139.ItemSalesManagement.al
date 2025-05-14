codeunit 50139 "Item Sales Management"
{

    var
        tempSalesHeader: Record "Sales Header" temporary;
        chartTable: Record "Chart Data";

    procedure GetData(var bcf: Record "Business Chart Buffer")
    var
        salesHeader: Record "Sales Header";
        salesLine: Record "Sales Line";
        bicycleQty: Integer;
        tourbikeQty: Integer;
        brakeeQty: Integer;
        index: Integer;
        displayText: Text;

    begin
        // Step 1: Gem alle WooCommerce ordrer i temp-tabel
        salesHeader.Reset();
        salesHeader.SetFilter("WooCommerceOrderID", '<>''''');

        if salesHeader.FindSet() then
            repeat
                tempSalesHeader.Init();
                tempSalesHeader."Document Type" := salesHeader."Document Type";
                tempSalesHeader."No." := salesHeader."No.";
                tempSalesHeader."WooCommerceOrderID" := salesHeader."WooCommerceOrderID";
                tempSalesHeader.Insert();
            until salesHeader.Next() = 0;

        Message('Antal fundne sales orders med WooCommerce ID: %1', tempSalesHeader.Count);

        // Step 2: Løb gennem hver ordre og fordel mængderne
        if tempSalesHeader.FindSet() then
            repeat
                salesLine.Reset();
                salesLine.SetRange("Document Type", tempSalesHeader."Document Type");
                salesLine.SetRange("Document No.", tempSalesHeader."No.");

                if salesLine.FindSet() then
                    repeat
                        case UpperCase(salesLine.Description) of
                            'BICYCLE':
                                bicycleQty += salesLine.Quantity;
                            'TOURING BICYCLE':
                                tourbikeQty += salesLine.Quantity;
                            'BRAKE':
                                brakeeQty += salesLine.Quantity;
                        end;
                    until salesLine.Next() = 0;
            until tempSalesHeader.Next() = 0;

        // Step 3: Vis resultatet
        Message('Bicycle: %1\TourBike: %2\Brake: %3', bicycleQty, tourbikeQty, brakeeQty);


        // Step 4: Indsæt i tabel
        // Ryd gamle data først - overskriver gamle data med nye
        chartTable.DeleteAll();

        // Indsæt nye værdier
        chartTable.Init();
        chartTable.Description := 'Bicycle';
        chartTable.Quantity := bicycleQty;
        chartTable.Insert();

        chartTable.Description := 'Tour Bicycle';
        chartTable.Quantity := tourbikeQty;
        chartTable.Insert();

        chartTable.Description := 'Brake';
        chartTable.Quantity := brakeeQty;
        chartTable.Insert();



        // DISPLAY CHART:

        index := 0;

        with bcf do begin
            Initialize();

            AddMeasure('Quantity', 0, "Data Type"::Integer, "Chart Type"::Column);
            SetXAxis('Item', "Data Type"::String);


            if chartTable.FindSet() then
                repeat

                    AddColumn(chartTable.Description);
                    SetValueByIndex(0, index, chartTable.Quantity);

                    index += 1;
                until chartTable.Next() = 0;

        end;


    end;

    procedure DrillDown(ItemName: Text)
    var
        item: Record Item;
    begin
        item.SetRange("Description", ItemName);
        Page.Run(Page::"Item Card", item);
    end;

}