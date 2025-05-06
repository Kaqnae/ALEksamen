table 50102 StudentLine
{
    Caption = 'StudentLine';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Line no."; Integer)
        {
            Caption = 'Line no.';
            AutoIncrement = true;
        }
        field(2; "Student no."; Code[20])
        {
            Caption = 'Student no.';
        }
        field(3; "Course Name"; Text[100])
        {
            Caption = 'Course Name';
        }
        field(4; Grade; Integer)
        {
            Caption = 'Grade';
        }
    }
    keys
    {
        key(PK; "Line no.", "Student no.")
        {
            Clustered = true;
        }

    }
}