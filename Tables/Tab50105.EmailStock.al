table 50105 "Email Stock"
{
    Caption = 'Email Stock';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Id; Integer)
        {
            Caption = 'Id';
            AutoIncrement = True;
        }
        field(2; Email; Text[100])
        {
            Caption = 'Email';
        }
        field(3; "Date"; Date)
        {
            Caption = 'Date';
        }
        field(4; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            TableRelation = Item;
        }
        field(5; "Inventory Quantity"; Integer)
        {
            Caption = 'Inventory Quantity';
        }
        field(6; "Threshold Quantity"; Integer)
        {
            Caption = 'Threshold Quantity';
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
