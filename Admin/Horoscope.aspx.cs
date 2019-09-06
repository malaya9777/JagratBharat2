using System;
using System.Linq;
using System.Web.UI.WebControls;

namespace Admin
{
    public partial class Horoscope : System.Web.UI.Page
    {
        DataDataContext db = new DataDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                loadInitialValues();
            }
        }


        // Load edit data to textboxes
        private void loadEditData(int horoscopeID)
        {
            if (horoscopeID != 0)
            {
                Session["horoscopeID"] = horoscopeID;
                var hs = db.Horoscopes.Where(n => n.Id == horoscopeID).SingleOrDefault();
                txtDate.Text = Convert.ToDateTime(hs.Date).ToString("dd-MMM-yyyy");
                txtHoroscope.Text = hs.Horoscope_English;
                ddlZodiac.SelectedValue = hs.Zodiac_ID.ToString();
                btnSubmit.Text = "Update";


            }
        }

        // Load initial values
        private void loadInitialValues()
        {
            txtDate.Text = DateTime.Now.ToString("dd-MMM-yyyy");
            loadDropdownLists();
            loadGridView(Convert.ToDateTime(ddlDate.SelectedValue));
        }

        // Load data to gridview
        private void loadGridView(DateTime dateTime)
        {
            var horoscope = db.Horoscopes.Where(n => n.Date == dateTime).Select(n => new
            {
                n.Id,
                zodiac = (db.Zodiacs.Where(m => m.Id == n.Zodiac_ID).Select(m => m.Zodiac_English + "(" + m.Zodiac_Odia + ")")).SingleOrDefault(),
                n.Horoscope_English,

            });
            grdHoroscope.DataSource = horoscope;
            grdHoroscope.DataBind();
        }

        // Load all Dropdowns
        private void loadDropdownLists()
        {
            loadZodiac();
            loadDates();


        }

        // Load dates to the date dropdown
        private void loadDates()
        {
            int m = 0;
            for (double i = 1; i > -6; i--)
            {
                ddlDate.Items.Insert(m, DateTime.Now.AddDays(i).ToString("dd-MMM-yyyy"));
                m++;
            }
        }
        // Load data to Zodiac dropdown
        private void loadZodiac()
        {
            var zodiacs = db.Zodiacs.Select(n => new
            {
                dataValue = n.Id,
                dataText = n.Zodiac_English + "(" + n.Zodiac_Odia + ")"
            }).ToList();
            ddlZodiac.DataTextField = "dataText";
            ddlZodiac.DataValueField = "dataValue";
            ddlZodiac.DataSource = zodiacs;
            ddlZodiac.DataBind();
            ddlZodiac.Items.Insert(0, new ListItem("Select Zodiac", "0"));
        }

        protected void ddlDate_SelectedIndexChanged(object sender, EventArgs e)
        {
            loadGridView(Convert.ToDateTime(ddlDate.SelectedValue));
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            var horoscopeID = horoscopeExists(Convert.ToInt32(ddlZodiac.SelectedValue), Convert.ToDateTime(txtDate.Text));
            if (horoscopeID == 0)
            {
                Horoscope horoscope = new Horoscope();
                horoscope.Zodiac_ID = Convert.ToInt32(ddlZodiac.SelectedValue);
                horoscope.Date = Convert.ToDateTime(txtDate.Text);
                horoscope.Horoscope_English = txtHoroscope.Text;
                db.Horoscopes.InsertOnSubmit(horoscope);

            }
            else
            {
                Horoscope horoscope = db.Horoscopes.Where(n => n.Id == horoscopeID).SingleOrDefault();
                horoscope.Zodiac_ID = Convert.ToInt32(ddlZodiac.SelectedValue);
                horoscope.Date = Convert.ToDateTime(txtDate.Text);
                horoscope.Horoscope_English = txtHoroscope.Text;

            }
            db.SubmitChanges();
            Response.Redirect(Request.RawUrl);





        }

        private int horoscopeExists(int v, DateTime dateTime)
        {
            var horoscope = db.Horoscopes.Where(n => n.Zodiac_ID == v && n.Date == dateTime).SingleOrDefault();
            if (horoscope != null)
            {
                return horoscope.Id;
            }
            return 0;
        }

        protected void grdHoroscope_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "editHoroscope")
            {
                var horoscopeID = Convert.ToInt16(e.CommandArgument);
                loadEditData(horoscopeID);
            }
        }



        protected void btnDelete_Click(object sender, EventArgs e)
        {
            var date = DateTime.Now.AddDays(-7);
            var horoscope = db.Horoscopes.Where(n => n.Date <= date);
            var count = horoscope.Count();
            db.Horoscopes.DeleteAllOnSubmit(horoscope);
            db.SubmitChanges();
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('" +count + " records delted!')", true);

        }
    }
}