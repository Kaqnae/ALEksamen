codeunit 50121 CreateCustomer
{
    procedure InsertCustomerWS(customerJson: Text): Boolean
    var
        JsonService: Codeunit JsonService;
        jsonObject: JsonObject;
        customerRec: Record Customer;
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        NewCustomerNo: Code[20];

    begin
        jsonObject.ReadFrom(customerJson);

        SalesSetup.Get();
        NewCustomerNo := NoSeriesMgt.GetNextNo(SalesSetup."Customer Nos.", Today, true);

        customerRec.Init();
        customerRec."No." := NewCustomerNo; // Automatisk genereret
        customerRec.Validate("WooCommerceCustomerID", JsonService.GetFieldTextAsText(jsonObject, 'WooCommerceId'));
        customerRec.Validate("Name", JsonService.GetFieldTextAsText(jsonObject, 'Name'));
        customerRec.Validate("E-Mail", JsonService.GetFieldTextAsText(jsonObject, 'Email'));
        customerRec."Gen. Bus. Posting Group" := 'INDENLANDS';
        customerRec."Customer Posting Group" := 'INDENLANDS';
        customerRec."Payment Terms Code" := '10 DAGE';
        customerRec.Insert();

        exit(true);
    end;
}