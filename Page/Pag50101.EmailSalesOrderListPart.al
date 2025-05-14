page 50127 "Email Sales Order ListPart"
{
    Caption = 'Email Sales Order ListPart';
    PageType = ListPart;
    SourceTable = "Email Sales Order Line";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(Id; Rec.Id)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Id field.', Comment = '%';
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Item No. field.', Comment = '%';
                }
                field("Item Desc"; Rec."Item Desc")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Item Description field.', Comment = '%';
                }
                field("Item Quantity"; Rec."Item Quantity")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Item Quantity field.', Comment = '%';
                }
                field("Unit Amount"; Rec."Unit Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Unit Amount field.', Comment = '%';
                }
            }
        }
    }
}
