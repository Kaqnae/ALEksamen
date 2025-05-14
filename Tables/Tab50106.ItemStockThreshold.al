table 50106 "Item Stock Threshold"
{
    Caption = 'Item Stock Threshold';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Item No."; Code[20])
        {
            Caption = 'Item No';
        }
        field(2; Threshold; Integer)
        {
            Caption = 'Threshold';
        }
    }
    keys
    {
        key(PK; "Item No.")
        {
            Clustered = true;
        }
    }
}
