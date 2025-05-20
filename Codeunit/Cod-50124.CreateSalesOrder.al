codeunit 50124 CreateSalesOrder
{
    procedure CreateOrder(orderJson: Text)
    var
        JsonService: Codeunit JsonService;
        jsonObject: JsonObject;
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        CustomerNo: Code[20];
        OrderId: Text;
    begin
        Message(orderJson);
        // Parse JSON
        jsonObject.ReadFrom(orderJson);

        // Hent ordre-ID og tjek for dublet
        OrderId := JsonService.GetFieldTextAsText(jsonObject, 'WooOrderId');
        SalesHeader.Reset();
        SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Order);
        SalesHeader.SetRange("WooCommerceOrderID", OrderId);
        if SalesHeader.FindFirst() then
            Error('Sales order with WooOrderId %1 already exists.', OrderId);

        // Find kunde
        CustomerNo := GetCustomerFromJson(jsonObject);

        // Opret salgsordre
        SalesHeader.Init();
        SalesHeader."Document Type" := SalesHeader."Document Type"::Order;
        SalesHeader.Validate("Sell-to Customer No.", CustomerNo);
        SalesHeader."WooCommerceOrderID" := OrderId;
        SalesHeader.Insert(true);

        // Opret ordrelinjer
        CreateSalesLines(SalesHeader, jsonObject);

        Message('Sales order %1 created successfully.', SalesHeader."No.");
    end;

    local procedure GetCustomerFromJson(jsonObject: JsonObject): Code[20]
    var
        JsonService: Codeunit JsonService;
        Customer: Record Customer;
        WooId: Text;
    begin
        WooId := JsonService.GetFieldTextAsText(jsonObject, 'WooCommerceCustomerId');
        Customer.SetRange("WooCommerceCustomerID", WooId);
        if not Customer.FindFirst() then
            Error('No customer found with WooCommerceCustomerId = %1.', WooId);

        exit(Customer."No.");
    end;

    local procedure CreateSalesLines(SalesHeader: Record "Sales Header"; jsonObject: JsonObject)
    var
        JsonService: Codeunit JsonService;
        SalesLine: Record "Sales Line";
        JsonToken: JsonToken;
        JsonArray: JsonArray;
        LineObject: JsonObject;
        Item: Record Item;
        WooItemID: Text;
        ItemNo: Code[20];
        i: Integer;
    begin
        JsonArray := JsonService.GetFieldAsArray(jsonObject, 'LineItems');

        for i := 0 to JsonArray.Count() - 1 do begin
            JsonArray.Get(i, JsonToken);
            LineObject := JsonToken.AsObject();

            // Hent WooItemID fra JSON (det du sender som 'ItemNo')
            WooItemID := JsonService.GetFieldTextAsText(LineObject, 'ItemNo');

            // Find varen i BC hvor WooItemID matcher
            Item.Reset();
            Item.SetRange("WooCommerceProductID", WooItemID);
            if not Item.FindFirst() then
                Error('Item with WooItemID "%1" not found in BC.', WooItemID);

            // Brug BC’s interne itemnummer
            ItemNo := Item."No.";

            // Opret Sales Line
            SalesLine.Init();
            SalesLine."Document Type" := SalesHeader."Document Type";
            SalesLine."Document No." := SalesHeader."No.";
            SalesLine."Line No." := GetNextLineNo(SalesHeader);
            SalesLine.Type := SalesLine.Type::Item;
            SalesLine.Validate("No.", ItemNo);
            SalesLine.Validate("Quantity", JsonService.GetFieldAsDecimal(LineObject, 'Quantity'));
            SalesLine.Insert(true);
        end;
    end;

    local procedure GetNextLineNo(SalesHeader: Record "Sales Header"): Integer
    var
        SalesLine: Record "Sales Line";
    begin
        SalesLine.SetRange("Document Type", SalesHeader."Document Type");
        SalesLine.SetRange("Document No.", SalesHeader."No.");
        if SalesLine.FindLast() then
            exit(SalesLine."Line No." + 10000) // typisk

        else
            exit(10000); // første linje
    end;
}