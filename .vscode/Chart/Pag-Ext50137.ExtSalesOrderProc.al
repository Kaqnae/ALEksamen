pageextension 50137 "Ext Sales Order Processor" extends "Order Processor Role Center"
{
    layout
    {

        addfirst(rolecenter)

        {

            //"Student Line Part" is a page part

            part(test; "Item Chart")

            {

                ApplicationArea = Basic, Suite;

            }

        }
        /*
        addfirst()
        {
            part(ItemChartPart; "Item Chart")
            {
                ApplicationArea = All;
            }
        }
        */
    }
}