table 50104 "Email Sales Order Line"
{
    Caption = 'Email Sales Order Line';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Id; Integer)
        {
            Caption = 'Id';
            AutoIncrement = True;
        }
        field(2; "Item Quantity"; Integer)
        {
            Caption = 'Item Quantity';
        }
        field(3; "Item Desc"; Text[50])
        {
            Caption = 'Item Description';
        }
        field(4; "Item No."; Text[20])
        {
            Caption = 'Item No.';
        }
        field(5; "Unit Amount"; Decimal)
        {

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
