table 50133 "Chart Data"
{
    fields
    {
        // The name of the product as shown in the chart (e.g., Bicycle, Touring Bicycle, Brake)
        field(1; Description; Text[50])
        {

        }

        // The total quantity sold of the product
        field(2; Quantity; Integer)
        {

        }
    }

    keys
    {
        key(PK; Description) { Clustered = true; }
    }
}
