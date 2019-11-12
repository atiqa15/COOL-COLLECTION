<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CoolCollection.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
	<style type="text/css">
		div.A
		{
			background-color:#00004d;
		}
		.style1
		{
			width:900px;
			
		}
		.style2{
			width:633px;
			text-align:left;
		}
		.style3{
			width:257px;
			text-align:center;
		}
		.style4{
			width:185px;
			text-align:center;
		}
		.style6{
			width:260px;
			text-align:left;
		}
		.style7{
			width:427px;
			text-align:center;
		}
		.style8{
			width:108px;
			text-align:center;
		}

	</style>
</head>
<body>
    <form id="form1" runat="server">
		<asp:ScriptManager ID="ScriptManager1" runat="server">
		</asp:ScriptManager>
		<asp:UpdatePanel ID="UpdatePanel1" runat="server" Height="100%">

		<ContentTemplate>
		
		<table align="center" class="style1">
			<tr>
				<td>
					<table align="center" class="style1" style="border-bottom-style:ridge; border-width:medium; border-color:#9933FF">
						<div class="A">
				<tr>
						
						<td class="style8" align="center" rowspan="2">
							<asp:Image ID="Image1" runat="server" Height="53px" ImageUrl="~/PNG/images.png" Width="72px" />
				&nbsp;
							</td>

					<td class="style6" rowspan="2">

						<asp:LinkButton ID="lblLogo" runat="server" Text="CoolCollections"  Font-Size="20pt" ForeColor="#00004d" OnClick="lblLogo_Click"></asp:LinkButton>
							<br />
					<b>	For Those Who Love Shopping</b>
						</td>
					<td class="style2" rowspan="2">
						<asp:Image ID="Image3" runat="server" Height="67px" ImageUrl="~/PNG/Happy.jpg" Width="282px" />
						</td>
					<td rowspan="2" align="right">
						<asp:Image ID="Image2" runat="server" Height="53px" ImageUrl="~/PNG/download.png" Width="70px" />
						</td>
					<td align="left">
						<asp:LinkButton ID="btnShoppingHeart" runat="server" Font-Underline="false" Font-Size="20pt" ForeColor="Red" OnClick="btnShoppingHeart_Click" >0</asp:LinkButton>
						</td>
					</tr>
							</div>
						</table>
</td>
				</tr>
			<tr>

			<td>
	<table align="center" class="style1" style="border:thin ridge #9900FF">
									<tr>
										<td class="style2">
											&nbsp;
											<asp:Label ID="lblCategoryName" runat="server"></asp:Label>
										
										</td>
										<td class="style3" style="border-left-style:ridge;border-width:thin; border-color:#9900FF">
											&nbsp;
											<asp:Label ID="lblProducts" runat="server" Text="Products" Font-Size="15pt" ForeColor="#00004d" ></asp:Label>
										</td>
									</tr>
								</table>
				</td>
				</tr>
				<tr>
					<td>
						<table align="center" class="style1">
							<tr>
					
							<td class="style2" valign="top">
									<asp:Panel ID="pnlProducts" runat="server" ScrollBars="Auto" Height="500px" BorderColor="Black" BorderStyle="Inset" BorderWidth="1px">
						<asp:DataList ID="dlProducts" runat="server" RepeatColumns="3" Width="600px" Font-Bold="false" Font-Italic="false" Font-Overline="false" Font-Underline="false">
							<ItemTemplate>
								<div align="left">
									<table cellpadding="1" class="style4" style="border: 1px ridge #9900FF">
										<tr>
											<td style="border-bottom-style:ridge; border-width:1px;border-color:#000000">
												<asp:Label ID="lblProductName" runat="server" Text='<%#Eval("ProductName")%>' Style="font-weight:700"></asp:Label>
											</td>
										</tr>
										
											<td>
												<img alt="" src='<%#Eval("ProductImage") %>' runat="server" id="imgProductPhoto" style="border:ridge 1px Black; width:173px;height:160px;" />

											</td>
										</tr>
										</tr>
										<tr>
											<td>
												Price:<asp:Label ID="lblPrice" runat="server" Text='<%# Eval("ProductPrice")%>'></asp:Label>
												<asp:Image ID="imgStar" runat="server" Visible="false" ImageUrl="~/PNG/star.jpg" />
												
												<asp:HiddenField ID="hfProductID" runat="server" Value='<%#Eval("ProductID") %>' />

											</td>
											</tr>										
										<tr>
											<td>
												<asp:Button ID="BtnAddToCart" runat="server" CommandArgument='<%#Eval("ProductID") %>'   Text="Add To Cart" Width="100%" BorderColor="Black" BorderStyle="Inset" BorderWidth="1px" CausesValidation="false" OnClick="BtnAddToCart_Click"/>
											</td>
										</tr>
										
										
									</table>
								</div>
							</ItemTemplate>
						</asp:DataList>
					</asp:Panel>
								<asp:Panel ID="pnlMyCart" runat="server" ScrollBars="Auto" Height="562px" BorderColor="Black" Visible="false" BorderStyle="Inset" BorderWidth="1px" style="margin-bottom: 29px">
						<table align="center" cellspacing="1">
							<tr>
								<td align="center">
							
							<asp:Label ID="lblAvailableStockAlert" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>						
					<asp:DataList ID="dlCartProducts" runat="server" RepeatColumns="3" Font-Bold="false" Font-Italic="false" Font-Overline="false" Font-Underline="false" width="551px" style="margin-bottom: 55px">
						<ItemTemplate>
							<div align="left">
								<table cellpadding="1" style="border:1px ridge #9900FF;text-align:center;width:172px;">
									<tr>
										<td style="border-bottom-style:ridge; border-width:1px;border-color:#000000">
											<asp:Label ID="lblProductName" runat="server" Text='<%#Eval("ProductName") %>' Style="font-weight:700"></asp:Label>
										</td>
									</tr>
									<tr>
										<td>
											<img alt="" src='<%#Eval("ProductImage") %>' runat="server" id="imgProductPhoto" style="border:ridge 1px black; width:173px;height:160px;" />
										</td>
									</tr>
								
							<tr>
								<td>
				                  <br />
									<b>Price:</b><asp:Label ID="lblPrice" runat="server" Text='<%#Eval("ProductPrice") %>' ></asp:Label>
									&nbsp;&nbsp;
									<asp:HiddenField ID="hfProductID" runat="server" Value='<%#Eval("ProductID") %>' />

								</td>
							</tr>
							<tr>
								<td>
									<hr />
									<asp:Button ID="btnRemoveFromCart" runat="server" CommandArgument='<%#Eval("ProductID") %>'
										Text="RemoveFromCart" Width="100%" BorderColor="Black" BorderStyle="Inset" BorderWidth="1px" CausesValidation="false" OnClick="btnRemoveFromCart_Click" />

								</td>
							</tr>
				             	</table>
								</div>
							</ItemTemplate>

						</asp:DataList>
									</td>
								</tr>
							</table>
				</asp:Panel>
			

							</td>
                    <td class="style3" valign="top" align="center">
	
			<asp:Panel ID="pnlCategories" runat="server" ScrollBars="Auto" Height="500px" BorderColor="Black" BorderStyle="Inset" BorderWidth="1px">
						<asp:DataList ID="dlCategories" runat="server" CellPadding="3" Width="252px" Height="142px" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" GridLines="Horizontal">
							
							<AlternatingItemStyle BackColor="#F7F7F7" />
							
							<FooterStyle BackColor ="#B5C7DE" ForeColor="#4A3C8C"/>
							<HeaderStyle BackColor ="#4A3C8C" Font-Bold="true" ForeColor="#F7F7F7" />
							
							<ItemStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
							
							<ItemTemplate>
								<asp:LinkButton ID="lbtnCategory" runat="server" Text='<%#Eval("CategoryName") %> '
									CommandArgument='<%#Eval("CategoryID") %>' OnClick="lbtnCategory_Click"></asp:LinkButton>
							</ItemTemplate>
							<SelectedItemStyle BackColor="#738A9C" Font-Bold="true" ForeColor="#F7F7F7" />

						</asp:DataList>
					</asp:Panel>

						<asp:Panel ID="pnlCheckout" runat="server" ScrollBars="Auto" Height="628px" BorderColor="Black" BorderStyle="Inset" BorderWidth="1px" Visible="false">
				<table style="width:258px;">
					<tr>
						<td align="left">
							<b>Name:</b>
						</td>
					</tr>
					<tr>
						<td>
							<asp:TextBox ID="txtCustomerName" runat="server" Width="233px"></asp:TextBox>
						<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCustomerName" ErorMessage="*" ForeColor="Red" ></asp:RequiredFieldValidator>
						</td>
					</tr>
					<tr>
						<td align="left">
							PhoneNo:
						</td>
					</tr>
					<tr>
						<td>
							<asp:TextBox ID="txtCustomerPhoneNo" runat="server" Width="233px" MaxLength="10"></asp:TextBox>
						<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtCustomerPhoneNo" ErorMessage="*" ForeColor="Red" ></asp:RequiredFieldValidator>
						
						</td>
					</tr>
					<tr>
						<td align="left">
							EmailID
					
						</td>

					</tr>
					<tr>
						<td>
							<asp:TextBox ID="txtCustomerEmailID" runat="server" Width="231px" MaxLength="10"></asp:TextBox>
						<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtCustomerEmailID" ErorMessage="*" ForeColor="Red" ></asp:RequiredFieldValidator>
						</td>
					</tr>
					<tr>
						<td align="left">
							Address
					
						</td>

					</tr>
					<tr>
						<td align="left">&nbsp;
							<asp:TextBox ID="txtCustomerAddress" runat="server" Width="227px" Height="81px" TextMode="MultiLine" ></asp:TextBox>
						<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtCustomerAddress" ErorMessage="*" ForeColor="Red" ></asp:RequiredFieldValidator>
						</td>
					</tr>
					<tr>
						<td align="left">
						Total Products :
					
						</td>

					</tr>
					<tr>
						<td align="center">
							&nbsp;<asp:TextBox ID="txtTotalProducts" runat="server" ReadOnly="true" Width="231px"></asp:TextBox>
						<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtTotalProducts" ErorMessage="*" ForeColor="Red" ></asp:RequiredFieldValidator>
						</td>
					</tr>
					<tr>
						<td align="left">
							Total Price :
					
						</td>

					</tr>
					<tr>
						<td>
							<asp:TextBox ID="txtTotalPrice" runat="server" ReadOnly="true" Width="231px"></asp:TextBox>
						<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtTotalPrice" ErorMessage="*" ForeColor="Red" ></asp:RequiredFieldValidator>
						</td>
					</tr>
					<tr>
						<td align="left">
							Payment Mode:
					
						</td>

					</tr>
					<tr>
						<td align="left">
							<asp:RadioButtonList ID="rblPaymentMethod" runat="server">
								<asp:ListItem Value="1" Selected="True" >1.Cash On Delivery</asp:ListItem>
								<asp:ListItem Value="1">2.Payment GateWay</asp:ListItem>
							</asp:RadioButtonList>
						</td>
					</tr>
					<tr>
						<td>
							<asp:Button ID="btnPlaceOrder" runat="server" Style="font-weight:700" Text="PlaceOrder" Width="90px" />

						</td>
					</tr>
					<tr>
						<td>
							<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtCustomerEmailID" ErrorMessage="Please Enter Valid Email Address" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
						</td>
					</tr>
				</table>
			</asp:Panel>

							</td>
							</tr>
							<tr>
								<td colspan="2">
									<asp:Panel ID="pnlEmptyCart" runat="server" AutoSizeMode = "GrowAndShrink" Visible="false">
										<div style="text-align:center;">
							
							<br />
							<br />
							<br />
							<asp:Image ID="Image4" runat="server" ImageUrl="~/PNG/empty_cart.jpeg" Width="300px" />
							<br />
							<br />
							<br />
							
											</div>
									</asp:Panel>
									<asp:Panel ID="pnlOrderPlacedSuccessfully" runat="server" Visible="false">
										<div style="text-align:center;">
							<asp:Image ID="Image5" runat="server" ImageUrl="~/PNG/star.jpg" Width="500px" /><br/>
							<br />
							<label>
								Order Placed Successfully
							</label><br /><br />
							Transaction Details Are Sent At Email Provided by you<br />
							<br />
							<br />
							<asp:Label ID ="lblTransactionNo" runat="server" Style="font-weight:700"></asp:Label>
						<br />
							<br />
							<br />
							<a href="#" target="_blank" >TrackYourTransactionDetailsHere</a>
						<br />
							<br />
							<br />
						
						</div>
									</asp:Panel>
								</td>
							</tr>
								<tr>
								<td colspan="2" align="center" style="border:thin ridge #9900FF">
									&nbsp;&copy;<a href="www.firebox.com">Cool Collections.BlogSpot.Com</a><a href="Admin/Login.aspx">AdminPanel</a> || <a href="TrackYourOrder.aspx" target="_blank">
										TrackOrderStatus</a>
									                                                             
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
	</ContentTemplate>
			</asp:UpdatePanel>
			</form>
</body>
</html>
