codeunit 50125 CreateSalesOrderEmail
{


    trigger OnRun()
    begin

    end;

    procedure CreateEmail(WooCommerceId: Text)
    var
        salesHeader: Record "Sales Header";
        salesLine: Record "Sales Line";
        emailHeader: Record Email;
        emailLines: Record "Email Sales Order Line";
        emailSender: Text;
        emailContent: Text;
        salesOrderId: Code[20];
    begin
        emailSender := 'group1@erpeksamen.dk';
        emailContent := 'We have recieved your order.';


        salesHeader.Reset();
        salesHeader.SetFilter("WooCommerceOrderID", WooCommerceId);


        if salesHeader.FindSet() then begin
            salesHeader.Init();
            salesOrderId := salesHeader."No.";
            Message('Sales header start');

            emailHeader.WooCommerceId := salesHeader."WooCommerceOrderID";
            emailHeader.Date := salesHeader."Order Date";
            emailHeader."Customer Name" := salesHeader."Sell-to Customer Name";
            emailHeader.Email := emailSender;
            emailHeader.EmailContent := emailContent;
            emailHeader.Insert();
        end;

        salesLine.Reset();
        salesLine.SetFilter("No.", salesOrderId);

        if salesLine.FindSet() then
            Message('Sales line start');
        repeat
            emailLines.Init();
            emailLines."Item No." := salesLine."No.";
            emailLines."Item Desc" := salesLine.Description;
            emailLines."Item Quantity" := salesLine.Quantity;
            emailLines."Unit Amount" := salesLine."Line Amount";
            emailLines.Insert();
        until salesLine.Next() = 0;
    end;



}
