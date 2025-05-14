page 50135 "Item Chart"
{
    Caption = 'Items Sold';
    PageType = CardPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Business Chart Buffer";

    layout
    {

        area(Content)
        {


            usercontrol(BusinessChart; "Microsoft.Dynamics.Nav.Client.BusinessChart")
            {

                ApplicationArea = All;

                trigger AddInReady()
                begin
                    UpdateChart();
                end;


                trigger Refresh()
                begin
                    UpdateChart();
                end;

                trigger DataPointClicked(point: JsonObject)
                var
                    JsonTokenXValueString: JsonToken;
                    XValueString: Text;

                begin
                    if point.Get('XValueString', JsonTokenXValueString) then begin
                        XValueString := Format(JsonTokenXValueString);
                        XValueString := DelChr(XValueString, '=', '"');

                        /*
                        if XValueString = 'Tour Bicycle' then
                            XValueString := 'Touring Bicycle';
                        */

                        itemSalesMgt.DrillDown(XValueString);
                    end;
                end;

            }
        }
    }

    var
        itemSalesMgt: Codeunit "Item Sales Management";

    local procedure UpdateChart()

    begin
        itemSalesMgt.GetData(Rec);
        rec.Update(CurrPage.BusinessChart);
    end;



}