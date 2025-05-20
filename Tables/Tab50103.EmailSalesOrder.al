table 50103 Email
{
    Caption = 'Email';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Id; Integer)
        {
            Caption = 'Id';
            AutoIncrement = true;
        }
        field(2; Email; Text[100])
        {
            Caption = 'Email';
        }
        field(3; "Customer Name"; Text[50])
        {
            Caption = 'Name';
        }
        field(4; WooCommerceId; Text[10])
        {
            Caption = 'WooCommerce Id';
        }
        field(5; "Date"; Date)
        {
            Caption = 'Date';
        }
        field(6; EmailContent; Text[1000])
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