using System.Collections.Generic;
using System.Drawing;
using UnityEngine;

public class Stair : MonoBehaviour
{
    [SerializeField] MeshRenderer m_Renderer;
    public ColorType colorType;
    public void ChangeColor(Material mat, ColorType type)
    {
        m_Renderer.material = mat;
        colorType = type;
    }
}
