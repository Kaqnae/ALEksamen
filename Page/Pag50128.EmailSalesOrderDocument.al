page 50128 "Email Sales Order Document "
{
    Caption = 'Email Sales Order Document ';
    PageType = Document;
    SourceTable = Email;
    UsageCategory = Administration;
    RefreshOnActivate = true;

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
                field(WooCommerceId; Rec.WooCommerceId)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the WooCommerce Id field.', Comment = '%';
                }
                field("Date"; Rec."Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date field.', Comment = '%';
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name field.', Comment = '%';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Email field.', Comment = '%';
                }
                field(EmailContent; Rec.EmailContent)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Content field.', Comment = '%';
                }
            }
            part(EmailLines; "Email Sales Order ListPart")
            {
                ApplicationArea = Basic, Suite;
                Editable = true;
                Enabled = true;
                SubPageLink = Id = field(Id);
                UpdatePropagation = Both;
            }

        }
    }

    actions
    {
        area(Processing)
        {
            action(RunTestProcedure)
            {
                ApplicationArea = All;
                Caption = 'Send Email';
                Image = Email;
                trigger OnAction()
                begin
                    test(); // Kalder din procedure
                end;
            }
        }
    }

    var
        testCode: Codeunit CreateSalesOrderEmail;

    local procedure test()
    begin
        testCode.CreateEmail('33');
    end;
}
