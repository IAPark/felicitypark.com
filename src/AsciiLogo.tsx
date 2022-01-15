import text from './filly_text'

export const AsciiLogo = (props: {width: number}) => (
  <div className='ascii-logo' style={{width: `${props.width}px`, fontSize: `${props.width/50}px`}}>
    {text}
  </div>
)