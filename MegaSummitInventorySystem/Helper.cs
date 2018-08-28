using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MegaSummitInventorySystem
{
    public class Helper
    {
        public static decimal GetTotalOnDiscount(string dis, decimal total)
        {
            string[] textArr1 = {};
            var TotalPlus = 0;
            var TotalMinus = 0;
            textArr1 = dis.Split('+');
            var totalAmount = (total);

            var NewTotal = 0;
            for (var i = 0; i < textArr1.Length; i++) {
                var ss = textArr1[i].ToString();

                if (ss.Contains("-")) {
                    string[] textArr2 = {};
                    textArr2 = textArr1[i].Split('-');


                    for (var z = 0; z < textArr2.Length; z++) {
                        if (z == 0) {

                            if (textArr2[z] != "") {

                                var disPer = decimal.Parse(textArr2[z]) / 100;
                                var discount = (totalAmount) * (disPer);
                                totalAmount = totalAmount + discount;
                            }
                        }
                        else {
                            if (textArr2[z] != "") {

                                var disPer = decimal.Parse(textArr2[z]) / 100;
                                var discount = (totalAmount) * (disPer);
                                totalAmount = totalAmount - discount;

                            }
                        }
                    }
                }
                else {
                    if (textArr1[i] != "") {
                        var disPer = decimal.Parse(textArr1[i]) / 100;
                        var discount = (totalAmount) * (disPer);
                        totalAmount = totalAmount + discount;
                    }
                }
            }

            return totalAmount;

        }

    }
}