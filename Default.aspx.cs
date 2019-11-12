using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CoolCollection.BusinessLayer;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Configuration;
namespace CoolCollection
{
	public partial class Default : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				lblCategoryName.Text = "Popular Products at CoolCollections"; //write in place of new Items at shopping cart
				GetCategory();
				GetProducts(0);
			}
			lblAvailableStockAlert.Text = string.Empty;
		}
		private void GetCategory()
		{
			ShoppingCart k = new ShoppingCart();
			dlCategories.DataSource = null;
			dlCategories.DataSource = k.GetCategories();
			dlCategories.DataBind();

		}
		private void GetProducts(int CategoryID)
		{
			ShoppingCart k = new ShoppingCart()
			{
				CategoryID = CategoryID
			};
			dlProducts.DataSource = null;
			dlProducts.DataSource = k.GetAllProducts();
			dlProducts.DataBind();

		}

		protected void lbtnCategory_Click(object sender, EventArgs e)
		{
			pnlMyCart.Visible = false;
			pnlProducts.Visible = true;

			int CategoryID = Convert.ToInt16((((LinkButton)sender).CommandArgument));
			GetProducts(CategoryID);
			HighlightCartProducts();
		}

		protected void lblLogo_Click(object sender, EventArgs e)
		{
			lblCategoryName.Text = "Popular Products At Shopping Cart At Cool Collections";
			lblProducts.Text = "Products";
			pnlCategories.Visible = true;
			pnlProducts.Visible = true;
			pnlMyCart.Visible = false;
			pnlCheckout.Visible = false;
			pnlEmptyCart.Visible = false;
			pnlOrderPlacedSuccessfully.Visible = false;
			GetProducts(0);
		}

		protected void BtnAddToCart_Click(object sender, EventArgs e)
		{
			string ProductID = Convert.ToInt16((((Button)sender).CommandArgument)).ToString();
			//string ProductQuantity = "1";
			DataListItem currentItem = (sender as Button).NamingContainer as DataListItem;

			if (Session["MyCart"] != null)
			{
				DataTable dt = (DataTable)Session["MyCart"];
				var checkProduct = dt.AsEnumerable().Where(r => r.Field<string>("ProductID") == ProductID);
				if (checkProduct.Count() == 0)
				{
					string query = "select * from Products where ProductID=" + ProductID + "";
					DataTable dtProducts = GetData(query);
					DataRow dr = dt.NewRow();
					dr["ProductID"] = ProductID;
					dr["ProductName"] = Convert.ToString(dtProducts.Rows[0]["ProductName"]);
					dr["ProductPrice"] = Convert.ToString(dtProducts.Rows[0]["ProductPrice"]);
					dr["ProductImage"] = Convert.ToString(dtProducts.Rows[0]["ProductImage"]);
					dr["ProductDescription"] = Convert.ToString(dtProducts.Rows[0]["ProductDescription"]);
					dt.Rows.Add(dr);
					Session["MyCart"] = dt;

					btnShoppingHeart.Text = dt.Rows.Count.ToString();
				}
			}
			else
			{
				string query = "select * from Products where ProductID=" + ProductID + "";
				DataTable dtProducts = GetData(query);
				DataTable dt = new DataTable();
				dt.Columns.Add("ProductID", typeof(string));
				dt.Columns.Add("ProductName", typeof(string));
				dt.Columns.Add("ProductPrice", typeof(string));
				dt.Columns.Add("ProductImage", typeof(string));
				dt.Columns.Add("ProductDescription", typeof(string));
				DataRow dr = dt.NewRow();
				dr["ProductID"] = ProductID;
				dr["ProductName"] = Convert.ToString(dtProducts.Rows[0]["ProductName"]);
				dr["ProductPrice"] = Convert.ToString(dtProducts.Rows[0]["ProductPrice"]);
				dr["ProductImage"] = Convert.ToString(dtProducts.Rows[0]["ProductImage"]);
				dr["ProductDescription"] = Convert.ToString(dtProducts.Rows[0]["ProductDescription"]);
				dt.Rows.Add(dr);
				Session["MyCart"] = dt;
				btnShoppingHeart.Text = dt.Rows.Count.ToString();
			}
			HighlightCartProducts();


		}
		public DataTable GetData(string query)
		{

			DataTable dt = new DataTable();
			string Conn = WebConfigurationManager.ConnectionStrings["Myconn"].ConnectionString;
			SqlConnection con = new SqlConnection(Conn);
			con.Open();
			SqlDataAdapter da = new SqlDataAdapter(query, con);
			da.Fill(dt);
			con.Close();
			return dt;

		}
		private void HighlightCartProducts()
		{
			if (Session["MyCart"] != null)
			{
				DataTable dtProductsAddToCart = (DataTable)Session["MyCart"];
				if (dtProductsAddToCart.Rows.Count > 0)
				{
					foreach (DataListItem item in dlProducts.Items)
					{
						HiddenField hfProductID = item.FindControl("hfProductID") as HiddenField;
						if (dtProductsAddToCart.AsEnumerable().Any(row => hfProductID.Value == row.Field<String>("ProductID")))
						{
							Button btnAddToCart = item.FindControl("btnAddToCart")as Button;
							btnAddToCart.BackColor = System.Drawing.Color.Aquamarine;
							btnAddToCart.Text = "Added to Cart";
							Image imgGreenStar = item.FindControl("imgStar") as Image;
							imgGreenStar.Visible = true;


						}
					}

				}
			}
		}

		protected void btnShoppingHeart_Click(object sender, EventArgs e)
		{
			GetMyCart();
			lblCategoryName.Text = "Products In Your Shopping Cart. ";
			lblProducts.Text = "Customer Details";
		}
		private void GetMyCart()
		{
			DataTable dtProducts;
			if (Session["MyCart"] != null)
			{
				dtProducts = (DataTable)Session["MyCart"];

			}
			else
			{
				dtProducts = new DataTable();
			}
			if (dtProducts.Rows.Count > 0)
			{
				txtTotalProducts.Text = dtProducts.Rows.Count.ToString();
				btnShoppingHeart.Text = dtProducts.Rows.Count.ToString();
				dlCartProducts.DataSource = dtProducts;
				dlCartProducts.DataBind();
				//UpdateTotalBill();
				pnlMyCart.Visible = true;
				pnlCheckout.Visible =false;
				pnlEmptyCart.Visible = false;
				pnlCategories.Visible = false;
				pnlProducts.Visible = false;
				pnlOrderPlacedSuccessfully.Visible = false;

			}
			else
			{
				
				pnlEmptyCart.Visible = true;
				pnlMyCart.Visible = false;
				pnlCheckout.Visible = false;
				
				pnlCategories.Visible = false;
				pnlProducts.Visible = false;
				pnlOrderPlacedSuccessfully.Visible = false;
				dlCartProducts.DataSource = null;
				dlCartProducts.DataBind();
				txtTotalProducts.Text = "0";
				txtTotalPrice.Text = "0";
				btnShoppingHeart.Text = "0";
			}
		}

		protected void btnRemoveFromCart_Click(object sender, EventArgs e)
		{
			string ProductID = Convert.ToInt16((((Button)sender).CommandArgument)).ToString();
		if (Session["MyCart"] != null)
			{
				DataTable dt = (DataTable)Session["MyCart"];
				DataRow drr = dt.Select("ProductID=" + ProductID + " ").FirstOrDefault();
				if (drr != null)
				

					dt.Rows.Remove(drr);
				Session["MyCart"] = dt;

			}

			GetMyCart();
				
				
				
	    }
	}
}