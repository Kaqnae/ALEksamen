page 50102 StudentDoc
{
    Caption = 'StudentDoc';
    PageType = Document;
    SourceTable = Student;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Student no."; Rec."Student no.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Student no. field.', Comment = '%';
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the First Name field.', Comment = '%';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Last Name field.', Comment = '%';
                }
                field(Birthday; Rec.Birthday)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Birthday field.', Comment = '%';
                }
                field(Education; Rec.Education)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Education field.', Comment = '%';
                }
                field("Phone no"; Rec."Phone no")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Phone no field.', Comment = '%';
                }

            }
        }
    }
}
