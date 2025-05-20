codeunit 50139 "Item Sales Management"
{

    var
        tempSalesHeader: Record "Sales Header" temporary;
        chartTable: Record "Chart Data";


    /// <summary>
    /// Calculates the total quantities sold for each webshop product and loads the results into the Business Chart Buffer.
    /// </summary>
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
        // Step 1: Collect all WooCommerce orders into a temporary table
        salesHeader.Reset();
        // Filter to include only orders where WooCommerceOrderID is not empty (i.e., has a value)
        salesHeader.SetFilter("WooCommerceOrderID", '<>''''');

        if salesHeader.FindSet() then
            repeat
                tempSalesHeader.Init();
                tempSalesHeader."Document Type" := salesHeader."Document Type";
                tempSalesHeader."No." := salesHeader."No.";
                tempSalesHeader."WooCommerceOrderID" := salesHeader."WooCommerceOrderID";
                tempSalesHeader.Insert();
            until salesHeader.Next() = 0;

        // Optional: log count for debuggin
        //Message('Found %1 WooCommerce orders', tempSalesHeader.Count);

        // Step 2: Iterate through each temp order and sum up quantities
        if tempSalesHeader.FindSet() then
            repeat
                salesLine.Reset();
                salesLine.SetRange("Document Type", tempSalesHeader."Document Type");
                salesLine.SetRange("Document No.", tempSalesHeader."No.");

                if salesLine.FindSet() then
                    repeat
                        // calculates the total quantity sold per product
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

        // Step 3: Display results for debugging purposes
        //Message('Totals – Bicycle: %1, Touring Bicycle: %2, Brake: %3', bicycleQty, tourbikeQty, brakeeQty);



        // Step 4: Clear existing chart data and insert fresh totals
        chartTable.DeleteAll();

        // inserts each product's total into the Chart Data table
        chartTable.Init();
        chartTable.Description := 'Bicycle';
        chartTable.Quantity := bicycleQty;
        chartTable.Insert();

        chartTable.Description := 'Touring Bicycle';
        chartTable.Quantity := tourbikeQty;
        chartTable.Insert();

        chartTable.Description := 'Brake';
        chartTable.Quantity := brakeeQty;
        chartTable.Insert();



        // Step 5: Load data into the Business Chart Buffer for visualization
        index := 0;

        with bcf do begin
            Initialize();
            // define the measure (Quantity) and chart type (Column)
            AddMeasure('Quantity', 0, "Data Type"::Integer, "Chart Type"::Column);
            SetXAxis('Item', "Data Type"::String);

            // add one column per chartTable record
            if chartTable.FindSet() then
                repeat

                    AddColumn(chartTable.Description);
                    SetValueByIndex(0, index, chartTable.Quantity);

                    index += 1;
                until chartTable.Next() = 0;
        end;
    end;


    /// <summary>
    /// Performs drill-down navigation to the Item Card for the given product name.
    /// </summary>
    procedure DrillDown(ItemName: Text)
    var
        item: Record Item;
    begin
        // locates the item by its description, then open the Item Card page
        item.SetRange("Description", ItemName);
        Page.Run(Page::"Item Card", item);
    end;

}