page 50112 StudentList
{
    PageType = List;
    SourceTable = Student;
    UsageCategory = Lists;
    ApplicationArea = All;
    Caption = 'Student OData';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Student no."; Rec."Student no.") { }
                field("First Name"; Rec."First Name") { }
                field("Last Name"; Rec."Last Name") { }
                field(Birthday; Rec.Birthday) { }
                field(Education; Rec.Education) { }
                field("Phone no"; Rec."Phone no") { }
            }
        }
    }
}