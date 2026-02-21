
font = "DejaVu Sans:style=Bold";
letter_size = 75;
height = 18;
string = "H";
offset_amount = 2; // Adjust for desired outline thickness

linear_extrude(height=height)
  difference() {
    text(string, size=letter_size, font=font, halign="center", valign="center", $fn=64);

    offset(delta=-offset_amount) {
      // Negative offset for internal outline
      text(string, size=letter_size, font=font, halign="center", valign="center", $fn=64);
    }
  }
