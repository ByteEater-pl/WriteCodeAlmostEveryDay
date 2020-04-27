const
  component = new class
  {
    constructor()
    {
      Object.assign(this, {
        handleChange: ({target: {name, type, value, checked}}) =>
          this.setState({[name]: type == "checkbox" ? checked : value}),
      })
    }
    setState(s) { console.log(s) }
  },
  f = component.handleChange
f({target: {name: "x", value: 3}})
