using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MegaSummitInventorySystem
{
    public class AutoCompleteData
    {
        public AutoCompleteData(long _id, string _value, string _text)
        {
            value = _value;
            label = _text;
            id = _id;
        }

        public AutoCompleteData(string _id, string _value, string _text)
        {
            value = _value;
            label = _text;
            _xid = _id;
        }

        public string _xid { get; set; }

        public long id { get; set; }
        public string value { get; set; }
        public string label { get; set; }
    }
}