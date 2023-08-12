using UnityEditor;
using UnityEditor.SceneManagement;
using UnityEngine;

[InitializeOnLoad]
public class Autosave
{
#if UNITY_EDITOR
    static Autosave()
    {
        EditorApplication.playModeStateChanged += SaveOnPlay;
    }

    private static void SaveOnPlay(PlayModeStateChange state) {
        if (state == PlayModeStateChange.ExitingEditMode)
        {
            Debug.Log("---> Auto saving... ---> Done!");
            EditorSceneManager.SaveOpenScenes();
            AssetDatabase.SaveAssets();
        }
    }
#endif
}
