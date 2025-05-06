page 50125 "Student Card"
{
    Caption = 'Student Card';
    PageType = Card;
    SourceTable = "Student";
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field(Name; Rec."First Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name field.', Comment = '%';
                }
                field(Lastname; Rec."Last name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Lastname field.', Comment = '%';
                }
                field(Birthdate; Rec.Birthday)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Birthdate field.', Comment = '%';
                }
                field("Phone Number"; Rec."Phone No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Phone Number field.', Comment = '%';
                }
                field("Student No."; Rec."Student No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Student No. field.', Comment = '%';
                }
                field(Education; Rec.Education)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Education field.', Comment = '%';
                }
            }
        }
    }
}
