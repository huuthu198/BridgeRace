using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "DataColor", menuName = "ScriptableObjects", order = 1)]
public class DataColor : ScriptableObject
{
    [SerializeField] Material[] colorMats;
    public List<ColorData> ColorDatas;

    public Material GetColorMat(ColorType colorType)
    {
        return colorMats[(int)colorType];
    }
}

[Serializable]
public struct ColorData
{
    public ColorType type;
    public Material mat;
}

public enum ColorType
{
    None = 0,
    Red = 1,
    Blue = 2,
    Yellow = 3,
    Green = 4,
    White = 5,

}