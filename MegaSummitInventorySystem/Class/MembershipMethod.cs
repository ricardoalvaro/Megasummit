using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.IO;
using System.Text;

/// <summary>
/// Summary description for MembershipMethod
/// </summary>
public class MembershipMethod
{
    private string _ErrorMessage = string.Empty;

	public MembershipMethod()
	{
		//
		// TODO: Add constructor logic here
		//
	}


    public bool CreateUser(ref string user_id, string user_name, string password, string email, string role)
    {
        try
        {
            MembershipUser mem = Membership.CreateUser(user_name, password, email);
            mem.IsApproved = true;
            Membership.UpdateUser(mem);
            Roles.AddUserToRole(user_name, role);
            user_id = Membership.GetUser(user_name).ProviderUserKey.ToString();
            return true;
        }
        catch (MembershipCreateUserException err)
        {
            _ErrorMessage = err.Message;
            return false;
        }        
        catch (Exception err)
        {
            _ErrorMessage = err.Message;
            return false;
        }

    }

    public bool UpdateEmail(string username, string email)
    {
        try
        {
            MembershipUser mem = Membership.GetUser(username);
            mem.Email = email;
            Membership.UpdateUser(mem);
            return true;
        }
        catch (Exception ex)
        {
            if (ex.Message.Equals("The E-mail supplied is invalid."))
                _ErrorMessage = "The E-mail supplied is invalid or already in use.";
            else
                _ErrorMessage = ex.Message;
        }
        return false;
    }

    public bool ResetPassword(string username, ref string newpassword)
    {
        try
        {
            newpassword = System.IO.Path.ChangeExtension(System.IO.Path.GetRandomFileName(), null);

            MembershipUser mem = Membership.GetUser(username);
            if (mem != null)
            {
                mem.ChangePassword(mem.GetPassword(), newpassword);
                Membership.UpdateUser(mem);
                newpassword = mem.GetPassword();
                return true;
            }
        }
        catch (Exception ex)
        {
            _ErrorMessage = ex.Message;
        }
        return false;
    }

    public bool IsValidMembershipEmailForUpdate(string username, string email)
    {
        try
        {
            MembershipUserCollection mm = Membership.FindUsersByEmail(email);

            if (mm.Count > 0)
                foreach (MembershipUser m in mm)
                    if ((m.UserName != username))
                    {
                        _ErrorMessage = "The E-mail supplied is already in use.<br/>";
                        return false;
                    }

            return true;
        }
        catch (Exception ex)
        {
            if (ex.Message.Length <= 60)
                _ErrorMessage = ex.Message;

            _ErrorMessage = "The E-mail supplied is invalid or already exist.";
            return false;
        }
    }

    public bool IsValidMembershipEmailForCreateNew(string email)
    {
        MembershipUserCollection mm = Membership.FindUsersByEmail(email);
        return mm.Count.Equals(0);
    }

    public bool IsValidMembershipUserNameForCreateNew(string username)
    {
        MembershipUserCollection mmusr = Membership.FindUsersByName(username);
        if (mmusr.Count.Equals(0))
        {
            return true;
        }
        else { return false;
        }
    }

    public static string UserID()
    {
        HttpContext Page = HttpContext.Current;

        string userId = string.Empty;

        if (Page.User.Identity.IsAuthenticated)
                userId = Membership.GetUser(Page.User.Identity.Name).ProviderUserKey.ToString();

        return userId;
    }

    public static string UserID(String UserName)
    {
        String userId = String.Empty;
        userId = Membership.GetUser(UserName).ProviderUserKey.ToString();

        return userId;
    }

    public static string UserIDByEmail(String Email)
    {
        string userId = string.Empty;
        userId = Membership.GetUser(Membership.GetUserNameByEmail(Email)).ProviderUserKey.ToString();

        return userId;
    }

    public string ErrorMessage
    {
        get { return _ErrorMessage; }
    }

}
