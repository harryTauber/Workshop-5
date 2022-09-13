using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class OscillateColours : MonoBehaviour
{
    [SerializeField] private float frequency = 1f;

    private Material _material;
    // Start is called before the first frame update
    void Start()
    {
        this._material = GetComponent<Renderer>().material;
    }

    // Update is called once per frame
    void Update()
    {
        var x = Time.time * this.frequency * Mathf.PI * 2f;
        var t = Mathf.InverseLerp(-1f, 1f, Mathf.Sin(x));

        this._material.SetFloat("_BlendFct", t);
    }
}
