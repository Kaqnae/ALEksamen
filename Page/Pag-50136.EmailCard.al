page 50136 "Email Card"
{
    Caption = 'Email Card';
    PageType = Card;
    SourceTable = "Email Stock";
    UsageCategory = Administration;


    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field(Id; Rec.Id)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Id field.', Comment = '%';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Email field.', Comment = '%';
                }
                field(Name; Rec."Item No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name field.', Comment = '%';
                }
                field(Subject; Rec."Inventory Quantity")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Subject field.', Comment = '%';
                }
                field("Date"; Rec."Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date field.', Comment = '%';
                }
                field(EmailContent; Rec."Threshold Quantity")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Content field.', Comment = '%';
                }
            }
        }
    }

}
