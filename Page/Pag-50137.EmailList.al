page 50137 "Email List"
{
    ApplicationArea = All;
    Caption = 'Email List';
    PageType = List;
    SourceTable = Email;
    UsageCategory = Lists;

    /*
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
                    field(Email; Rec.Email)
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Email field.', Comment = '%';
                    }
                    field(Name; Rec.Name)
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Name field.', Comment = '%';
                    }
                    field(Subject; Rec.Subject)
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Subject field.', Comment = '%';
                    }
                    field("Date"; Rec."Date")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Date field.', Comment = '%';
                    }

                }
            }
        }

     **/
}
