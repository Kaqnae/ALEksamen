pageextension 50137 "Ext Sales Order Processor" extends "Order Processor Role Center"
{
    layout
    {

        // Inserts our custom chart part at the top of the role center
        addfirst(rolecenter)

        {
            part(ItemChartPart; "Item Chart")

            {
                ApplicationArea = Basic, Suite;
            }

        }

    }
}