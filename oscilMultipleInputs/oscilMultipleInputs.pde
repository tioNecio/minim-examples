import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioOutput out;
WobbleInstrument myWobble;

void setup()
{
  size(512, 200, P2D);

  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO, 1024);
  //myWobble = new WobbleInstrument( , 1.0, 3.5, out);
  //poop = 900;
  out.playNote(0.0, 14.1, new WobbleInstrument( 432f, 0.6, 0.6, out) );
  //out.playNote(1.0, 4.1, new WobbleInstrument( 400f, 0.6, 400.3, out) );
  //out.playNote(1.6, 3.1, new WobbleInstrument( 323f, 0.6, 500.9, out) );
  //out.playNote(2.2, 3.4, new WobbleInstrument( 431f, 0.6, 600.4, out) );
}

void draw()
{
  background(0);
  stroke(255);
  // draw the waveforms
  for(int i = 0; i < out.bufferSize() - 1; i++)
  {
    float x1 = map(i, 0, out.bufferSize(), 0, width);
    float x2 = map(i+1, 0, out.bufferSize(), 0, width);
    line(x1, 50 + out.left.get(i)*50, x2, 50 + out.left.get(i+1)*50);
    line(x1, 150 + out.right.get(i)*50, x2, 150 + out.right.get(i+1)*50);
  }  
}

void mousePressed()
{
  myWobble.noteOn();
}

void mouseReleased()
{
  myWobble.noteOff();
}

void stop()
{
  out.close();
  minim.stop();

  super.stop();
}

