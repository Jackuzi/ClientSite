<%@ Page Language="C#" AutoEventWireup="true" CodeFile="main.aspx.cs" Inherits="_Default" Async="true" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

</head>
<body>
 
    <form id="form1" runat="server" >
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
<header class="navbar navbar-expand-sm bg-dark navbar-dark">
        <asp:TextBox ID="TextBox1" runat="server" class="form-control mr-sm-2" type="text" placeholder="Search"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Search" OnClick="Button1_Click1" class="btn btn-success btn btn-primary btn-sm" type="submit" />
        <ajaxToolkit:RoundedCornersExtender ID="Button1_RoundedCornersExtender" runat="server" BehaviorID="Button1_RoundedCornersExtender" TargetControlID="Button1" />
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Show All" class="btn btn-success btn btn-primary btn-sm" type="submit" />
         <ajaxToolkit:RoundedCornersExtender ID="Button2_RoundedCornersExtender" runat="server" BehaviorID="Button2_RoundedCornersExtender" TargetControlID="Button2" />
         </header>   
        <asp:Panel ID="PanelWarning" runat="server" Visible="False">
                <div class="alert alert-warning" role="alert">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    <strong>Error!</strong> No results, please correct search criteria :)
  </div>
</asp:Panel>
        <asp:UpdateProgress runat="server" id="PageUpdateProgress">
            <ProgressTemplate>
                Loading...
            </ProgressTemplate>
        </asp:UpdateProgress>
        <asp:UpdatePanel runat="server" id="Panel">
            <ContentTemplate>
                        <div class="table-responsive">
         <table class="table">
                <asp:Repeater ID="RepeaterAlbums" runat="server">
                    <HeaderTemplate>
                        <tr>
                            <th scope="col">Id</th>
                            <th scope="col">Name</th>
                            <th scope="col">Author Name</th>
                            <th scope="col">Date Added</th>
                           
                        </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                          <td>
                                <asp:Label ID="LabelMessageID" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                            </td>
                              <td>
                                <asp:Label ID="LabelName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="LabelEmail" runat="server" Text='<%# Eval("AuthorName") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="LabelDate" runat="server"  Text='<%#((Convert.ToDateTime(Eval("DateAdded"))).ToShortDateString()) %>'></asp:Label>
                            </td>              
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </table>
            </div>
            </ContentTemplate>
        </asp:UpdatePanel>

    </form>
</body>
</html>
