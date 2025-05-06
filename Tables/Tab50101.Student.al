table 50101 Student
{
    Caption = 'Student';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Student no."; Code[20])
        {
            Caption = 'Student no.';
            DataClassification = ToBeClassified;
        }
        field(2; "First Name"; Text[100])
        {
            Caption = 'First Name';
        }
        field(3; "Last Name"; Text[100])
        {
            Caption = 'Last Name';
        }
        field(4; Birthday; Date)
        {
            Caption = 'Birthday';
        }
        field(5; Education; Option)
        {
            Caption = 'Education';
            OptionMembers = DMU,Salg,Datatekniker;
        }
        field(6; "Phone no"; Text[15])
        {
            Caption = 'Phone no';
        }
    }
    keys
    {
        key(PK; "Student no.")
        {
            Clustered = true;
        }
    }
    trigger OnDelete()
    var
        StudentLine: Record 50102;
    begin
        // Delete all related StudentLine records before deleting the Student
        StudentLine.SetRange("Student no.", Rec."Student no.");
        if StudentLine.FindSet() then
            StudentLine.DeleteAll();
    end;


}