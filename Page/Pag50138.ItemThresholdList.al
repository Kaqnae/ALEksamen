page 50138 "Item Threshold List"
{
    ApplicationArea = All;
    Caption = 'Item Threshold List';
    PageType = List;
    SourceTable = "Item Stock Threshold";
    UsageCategory = Lists;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Item No field.', Comment = '%';
                }
                field(Threshold; Rec.Threshold)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Threshold field.', Comment = '%';
                }
            }
        }
    }
}
