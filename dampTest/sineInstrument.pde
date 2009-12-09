class SineInstrument implements Instrument
{
  Oscil sineOsc;
  Gain  gain;
  Damp  damp;
  AudioOutput out;
  
  SineInstrument(float frequency, float amplitude, AudioOutput output)
  {
    out = output;
    sineOsc = new Oscil(frequency, amplitude, Waves.Sine);
    gain = new Gain(0);
    damp = new Damp(0.2);
    sineOsc.patch(damp).patch(gain).patch(out);
  }
  
  void noteOn()
  {
    //println("Note on!");
    gain.setValue(1);
  }
  
  void noteOff()
  {
    //println("Note off!");
    gain.setValue(0);
  }
}
