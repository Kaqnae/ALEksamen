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
        // Hvis der ikke findes nogle tærskel-poster, så afslutter vi
        if not ThresholdRec.FindSet() then
            exit;

        // Gennemgår hver post i Item stock threshold tabellen
        repeat
            // Forsøg at finde den tilsvarende vare
            if ItemRec.Get(ThresholdRec."Item No.") then begin
                // Beregn den aktuelle varelager
                ItemRec.CalcFields(Inventory);
                InventoryQty := ItemRec.Inventory;
                // Hvis lagerbeholdningen er under tærsklen, så oprettes en email
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
        // Her går den videre til næste post
        until ThresholdRec.Next() = 0;
    end;
}
