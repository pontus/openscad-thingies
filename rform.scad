
font = "DejaVu Sans:style=Bold";
letter_size = 60;
height = 13;
string = "R";
offset_amount = 1; // Adjust for desired outline thickness


linear_extrude(height = height)
  difference() {
    text(string, size = letter_size, font = font, halign = "center", valign = "center", $fn = 64);

    offset(delta = -offset_amount) { // Negative offset for internal outline
      text(string, size = letter_size, font = font, halign = "center", valign = "center", $fn = 64);
    }

  }
linear_extrude(height = 1)
  text(string, size = letter_size, font = font, halign = "center", valign = "center", $fn = 64);
