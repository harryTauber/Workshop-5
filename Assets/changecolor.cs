using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class changecolor : MonoBehaviour
{
    [SerializeField] Shader shader;
    private Material material;
    // Start is called before the first frame update
    void Start()
    {
        this.material = GetComponent<MeshRenderer>().material;
        material.shader = shader;
    }

    // Update is called once per frame
    void Update()
    {
        float t = Time.time % 1;
        this.material.color = Color.HSVToRGB(t,1,1);
    }
}
