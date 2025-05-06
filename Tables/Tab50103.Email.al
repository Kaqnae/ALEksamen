table 50103 Email
{
    Caption = 'Email';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Id; Integer)
        {
            Caption = 'Id';
        }
        field(2; Email; Text[100])
        {
            Caption = 'Email';
        }
        field(3; Name; Text[50])
        {
            Caption = 'Name';
        }
        field(4; Subject; Text[50])
        {
            Caption = 'Subject';
        }
        field(5; "Date"; Date)
        {
            Caption = 'Date';
        }
        field(6; Content; Text[1000])
        {
            Caption = 'Content';
        }
    }
    keys
    {
        key(PK; Id)
        {
            Clustered = true;
        }
    }
}