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

                // Fired when the chart control is initialized
                trigger AddInReady()
                begin
                    UpdateChart();
                end;


                // Fired when a refresh occurs
                trigger Refresh()
                begin
                    UpdateChart();
                end;


                // Handle clicks on data points to perform drill-down navigation
                trigger DataPointClicked(point: JsonObject)
                var
                    JsonTokenXValueString: JsonToken;
                    XValueString: Text;

                begin
                    if point.Get('XValueString', JsonTokenXValueString) then begin
                        // Extract and clean the X-axis value (product name)
                        XValueString := Format(JsonTokenXValueString);
                        XValueString := DelChr(XValueString, '=', '"');

                        // Navigates to the corresponding Item Card
                        itemSalesMgt.DrillDown(XValueString);
                    end;
                end;

            }
        }
    }

    var
        itemSalesMgt: Codeunit "Item Sales Management";


    // Refreshes the chart by fetching up-to-date data from the codeunit
    local procedure UpdateChart()

    begin
        itemSalesMgt.GetData(Rec);
        rec.Update(CurrPage.BusinessChart);
    end;



}