codeunit 50123 "Item Stock Checker"
{
    Subtype = Normal;

    trigger OnRun()
    var
        ThresholdRec: Record "Item Stock Threshold";
        ItemRec: Record Item;
        EmailStockRec: Record "Email Stock";
        InventoryQty: Integer;
    begin
        if not ThresholdRec.FindSet() then
            exit;

        repeat
            if ItemRec.Get(ThresholdRec."Item No.") then begin
                ItemRec.CalcFields(Inventory);
                InventoryQty := ItemRec.Inventory;
                if InventoryQty < ThresholdRec."Threshold" then begin
                    EmailStockRec.Init();
                    EmailStockRec."Id" := 0;
                    EmailStockRec."Email" := 'lager@firma.dk';
                    EmailStockRec."Date" := Today;
                    EmailStockRec."Item No." := ItemRec."No.";
                    EmailStockRec."Inventory Quantity" := InventoryQty;
                    EmailStockRec."Threshold Quantity" := ThresholdRec."Threshold";
                    EmailStockRec.Insert();
                end;
            end;
        until ThresholdRec.Next() = 0;
    end;
}
